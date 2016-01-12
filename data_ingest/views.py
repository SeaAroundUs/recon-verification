from django.shortcuts import render
from django.views.generic.base import View
from django.views.generic.edit import CreateView
from django.http import HttpResponse, HttpResponseNotFound, HttpResponseBadRequest
from data_ingest.models import FileUpload, RawCatch
from data_ingest.forms import FileUploadForm
from data_ingest.ingest import normalize, commit, get_warnings, get_errors, get_committed_ids
from catch.models import Reference, Catch
from storages.backends.s3boto import S3BotoStorage
from catch.logging import TableEdit
from data_ingest.custom import Custom
import logging
import simplejson
import os


logger = logging.getLogger(__name__)


class ReconResponse(object):
    def __new__(cls, payload):
        return HttpResponse(simplejson.dumps(payload, use_decimal=True), content_type='application/json')


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


class DataBrowseView(View):
    template = 'browse_upload.html'

    def get(self, request):
        params = {
            'fields': RawCatch.allowed_query_fields(),
            'references': Reference.objects.order_by('filename').values_list('reference_id', 'filename')
        }
        return render(request, self.template, params)


class EditNormalizeView(View):
    template = 'edit_normalize.html'

    def get(self, request):

        if 'get_count' in request.GET:
            count = RawCatch.objects.from_request(request).count()
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

        return render(request, self.template, params)


class CatchFieldsJsonView(View):
    def get(self, request):
        return ReconResponse(RawCatch.fields())


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


class DataNormalizationView(View):
    def post(self, request):
        ids = simplejson.loads(request.body).get('ids', '')
        normalize(ids)
        return ReconResponse(get_raw_catch_data(ids=ids))


class CommitView(View):
    def post(self, request):
        ids = simplejson.loads(request.body).get('ids', '')
        try:
            commit(ids)
            return ReconResponse({'result': 'ok'})
        except Exception as e:
            logger.exception('Commit error')
            return ReconResponse({'result': 'not ok', 'exception': e.__str__()})


class UploadRefView(View):
    def post(self, request):
        file = request.FILES.get('file', None)

        if not file:
            return ReconResponse({'result': 'not ok', 'exception': 'file not found'})

        S3BotoStorage(bucket='recon-verification').save(name=os.path.join('references', file.name), content=file)
        Reference(filename=file.name).save()

        logger.info('{} uploaded {}'.format(self.request.user, file.name))
        return ReconResponse({'result': 'ok'})


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


class HealthView(View):
    template = 'health.html'

    def get(self, request):
        raw_catch_warnings = [(view.view, view.message, view.count())
                              for view in RawCatch.warning_views()]
        raw_catch_errors = [(view.view, view.message, view.count())
                            for view in RawCatch.error_views()]
        catch_warnings = [(view.view, view.message, view.count())
                          for view in Catch.warning_views()]
        catch_errors = [(view.view, view.message, view.count())
                        for view in Catch.error_views()]
        params = {'raw_catch_warnings': raw_catch_warnings,
                  'raw_catch_errors': raw_catch_errors,
                  'catch_warnings': catch_warnings,
                  'catch_errors': catch_errors}
        return render(request, self.template, params)


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
