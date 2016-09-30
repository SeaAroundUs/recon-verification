from django.shortcuts import render, get_object_or_404
from django.views.generic.base import View
from django.views.generic.edit import CreateView
from django.http import HttpResponse, HttpResponseNotFound, HttpResponseBadRequest, \
    HttpResponseRedirect, HttpResponseForbidden
from django.core.urlresolvers import reverse
from data_ingest.models import FileUpload, RawCatch, ValidationRule
from data_ingest.forms import FileUploadForm, QueryForm, AuthorizeForm
from data_ingest.ingest import normalize, commit, get_warnings, get_errors, get_committed_ids
from catch.models import Reference, Catch, AdHocQuery, User, Taxon
from storages.backends.s3boto import S3BotoStorage
from catch.logging import TableEdit
from data_ingest.custom import Custom
import logging
import simplejson
import os


logger = logging.getLogger(__name__)


# extended response class to keep web app responses pretty consistent
class ReconResponse(object):
    def __new__(cls, payload):
        return HttpResponse(simplejson.dumps(payload, use_decimal=True), content_type='application/json')


# method to ease grabbing raw_catch data on a page-by-page basis
def get_raw_catch_data(page=None, ids=None, request=None):
    if page and request:
        raw_data = RawCatch.objects.from_request(request).order_by('id').page(page)
        ids = [x.id for x in raw_data]
    elif ids:
        raw_data = RawCatch.objects.filter(id__in=ids).order_by('id').all()
    else:
        raise Exception('Expected page or ids')

    raw_data_response = {
        'data': [x.to_dict() for x in raw_data],
        'warnings': get_warnings(ids),
        'errors': get_errors(ids),
        'committed': get_committed_ids(ids)
    }

    return raw_data_response


# view that handles the spreadsheet upload; is only hit via AJAX
class FileUploadCreateView(CreateView):
    model = FileUpload
    form_class = FileUploadForm

    def get_form_kwargs(self):
        kwargs = super().get_form_kwargs()
        kwargs['request'] = self.request
        return kwargs

    def form_valid(self, form):
        # don't save the form here since it gets saved during validation
        return HttpResponse(
                content=simplejson.dumps('upload success'),
                content_type='application/json',
                status=200,
        )

    def form_invalid(self, form):
        return HttpResponse(
            content=simplejson.dumps(form.errors),
            content_type='application/json',
            status=400,
        )


# this view handles the working set generation page
class DataBrowseView(View):
    template = 'browse_upload.html'

    def get(self, request):
        params = {
            'fields': RawCatch.allowed_query_fields(),
            'references': Reference.objects.exclude(type="Historic").order_by('filename', 'main_area_name').values_list('reference_id', 'filename', 'main_area_name'),
            'sources': FileUpload.objects.order_by('-create_datetime').values_list('id', 'file', 'comment')
        }
        return render(request, self.template, params)


# this view handles the page that has the javascript editor
class EditNormalizeView(View):
    template = 'edit_normalize.html'

    def get(self, request):
        count = RawCatch.objects.from_request(request).count()

        if 'get_count' in request.GET:
            return ReconResponse({'count': count})

        page = int(request.GET.get('page', 1))
        last_page = RawCatch.objects.from_request(request).last_page()

        params = {'page': page, 'pages': list(range(1, last_page + 1))}
        if page > 1:
            params['previous_page'] = page - 1
        if page < last_page:
            params['next_page'] = page + 1

        if 'page' in request.GET:
            get = request.GET.copy()
            del get['page']
            params['querystring'] = get.urlencode()
        else:
            params['querystring'] = request.GET.urlencode()

        params['total_count'] = count

        return render(request, self.template, params)


# json endpoint to list fields used by the javascript editor
class CatchFieldsJsonView(View):
    def get(self, request):
        return ReconResponse(RawCatch.fields())

# json endpoint to provide the data inside the javascript editor
class UploadDataJsonView(View):
    def get(self, request, page):
        if not RawCatch.objects.from_request(request).exists():
            return HttpResponseNotFound()
        else:
            return ReconResponse(get_raw_catch_data(page=page, request=request))

    def post(self, request):
        try:
            RawCatch.bulk_save(simplejson.loads(request.body)['data'], request)
            return ReconResponse({'result': 'ok'})

        except Exception as e:
            logger.exception('Save error')
            return ReconResponse({'result': 'not ok', 'exception': e.__str__()})


# endpoint that is POST'd to that normalizes the data inside the raw_catch table
class DataNormalizationView(View):
    def post(self, request):
        ids = simplejson.loads(request.body).get('ids', '')
        normalize(ids)
        return ReconResponse(get_raw_catch_data(ids=ids))


# view that handles the normalize source file feature; is only hit via AJAX
class NormalizeSourceView(View):
    model = RawCatch

    def post(self, request):
        try:
            sourceFileId = simplejson.loads(request.body).get('source-file-id', '')
            ids = self.model.objects.filter(source_file_id=sourceFileId).values_list('id', flat=True)
            normalize(ids)
            return ReconResponse({'result': 'ok'})

        except Exception as e:
            logger.exception('Normalize source file error')
            return ReconResponse({'result': 'not ok', 'exception': e.__str__()})


# endpoint that is POST'd to that commits data in raw_catch to catch
class CommitView(View):
    def post(self, request):
        ids = simplejson.loads(request.body).get('ids', '')
        try:
            commit(ids)
            return ReconResponse({'result': 'ok'})
        except Exception as e:
            logger.exception('Commit error')
            return ReconResponse({'result': 'not ok', 'exception': e.__str__()})


# this view handles uploading of new references
class UploadRefView(View):
    def post(self, request):
        file = request.FILES.get('file', None)

        if not file:
            return ReconResponse({'result': 'not ok', 'exception': 'file not found'})

        S3BotoStorage(bucket='recon-verification').save(name=os.path.join('references', file.name), content=file)
        Reference(filename=file.name).save()

        logger.info('{} uploaded {}'.format(self.request.user, file.name))
        return ReconResponse({'result': 'ok'})


# this endpoint handles deleting single rows via the javascript editor
class DeleteRowView(View):
    def get(self, request):
        row_id = request.GET.get('rowId', None)

        if not row_id:
            return HttpResponseBadRequest('Missing required parameter: row_id')

        try:
            RawCatch.objects.get(id=row_id).delete()
            TableEdit.log_delete(request.user, 'raw_catch', 1)
        except RawCatch.DoesNotExist:
            return HttpResponseNotFound('Row does not exist')

        return ReconResponse({'result': 'ok'})


# view that handles the health section of the site
class HealthView(View):
    template = 'health.html'

    def get(self, request):
        if 'get_ids_only' in request.GET:
            view_name = request.GET['view_name']

            if view_name.startswith("v_distribution_"):
                error_views = Taxon.error_views()
            elif view_name.startswith("v_raw_"):
                error_views = RawCatch.error_views()
            elif view_name.startswith("v_catch_"):
                error_views = Catch.error_views()

            for view in error_views:
                if view.view_name() == view_name:
                    ids = view.all()
                    return ReconResponse({'ids': [x[0] for x in ids], 'description': view.message})
        else:
            if len(request.GET) == 0:
                current_tab = 'raw_catch'
            else:
                current_tab = request.GET['current_tab']

            raw_catch_warnings = [(view.view, view.message, view.count(), view.view_name(), view.executed())
                                  for view in RawCatch.warning_views()]
            raw_catch_errors = [(view.view, view.message, view.count(), view.view_name(), view.executed())
                                for view in RawCatch.error_views()]
            catch_warnings = [(view.view, view.message, view.count(), view.view_name(), view.executed())
                              for view in Catch.warning_views()]
            catch_errors = [(view.view, view.message, view.count(), view.view_name(), view.executed())
                            for view in Catch.error_views()]
            distribution_errors = [(view.view, view.message, view.count(), view.view_name(), view.executed())
                            for view in Taxon.error_views()]
            params = {'current_tab': current_tab,
                      'raw_catch_warnings': raw_catch_warnings,
                      'raw_catch_errors': raw_catch_errors,
                      'catch_warnings': catch_warnings,
                      'catch_errors': catch_errors,
                      'distribution_errors': distribution_errors}
            return render(request, self.template, params)

    def post(self, request):
        view_name = request.GET['view_name']
        current_tab = request.GET['current_tab']
        ValidationRule.refresh_rule_partition(view_name)
        return HttpResponseRedirect(reverse('health') + '?current_tab=' + str(current_tab))

# view that handles the custom view section of the site
class CustomView(View):
    template = 'custom.html'

    def get(self, request):
        if 'view' in request.GET:
            view = Custom(request.GET.get('view', None))
            results = view.results()
            params = {
                'view_name': str(view),
                'headers': results[0],
                'results': results[1:]
            }
        else:
            params = {
                'views': Custom.view_list()
            }
        return render(request, self.template, params)


# view that handles the ad hoc query screen
class AdHocView(View):
    template = 'adhoc.html'

    def get(self, request):
        if 'id' in request.GET:
            query = AdHocQuery.get_for_view(request.user, request.GET.get('id'))[0]

            params = {
                'form': QueryForm.get_run_form(query.id),
                'approve_form': QueryForm.get_approve_form(query.id),
                'authorize_form': AuthorizeForm(initial={'id': query.id}),
                'runnable': query.runnable(),
                'approveable': query.approveable(request.user),
                'authorizable': query.authorizable(request.user),
                'created_by_self': query.created_by_auth_user == request.user,
                'query': query,
            }
        else:
            params = {
                'queries': AdHocQuery.get_for_view(request.user)
            }
        return render(request, self.template, params)

    def post(self, request):
        type = request.POST.get('type')
        query = get_object_or_404(AdHocQuery, pk=request.POST.get('id'))

        if type == 'run' and query.runnable():
            query.run(request.user)

        elif type == 'approve' and query.approveable(request.user):
            query.approve(request.user)

        elif type == 'authorize' and query.authorizable(request.user):
            auth_user = get_object_or_404(User, pk=request.POST.get('user'))
            query.authorize(request.user, auth_user)

        else:
            return HttpResponseForbidden()

        return HttpResponseRedirect(reverse('adhoc') + '?id=' + str(query.id))
