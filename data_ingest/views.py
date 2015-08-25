from django.shortcuts import render
from django.views.generic.base import View
from django.views.generic.edit import CreateView
from django.http import HttpResponse, HttpResponseNotFound
from data_ingest.models import FileUpload, RawCatch
from data_ingest.forms import FileUploadForm
from data_ingest.ingest import normalize, commit, get_warnings, get_errors, get_committed_ids
from reconstruction_verification.settings import ROWS_PER_PAGE
import logging
import simplejson


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
        # todo:  limit file types and *sizes*?

        data = {'files': []}
        file_attributes = getattr(form.save(), 'file')

        # todo:  fragile.  sanity check file_attributes.
        if file_attributes:
            data['files'].append({
                'name': file_attributes.name,
                'url': file_attributes.url,
                'size': file_attributes.size,
            })
            if len(data['files']) > 0:
                logger.info(u'{0} uploaded {1}.'.format(self.request.user, data['files'][0]['url']))

        response = HttpResponse(
            content=simplejson.dumps(data),
            content_type='application/json',
        )
        response['Content-Disposition'] = 'inline; filename=files.json'
        return response

    def form_invalid(self, form):
        return HttpResponse(
            content=simplejson.dumps(form.errors),
            content_type='application/json',
            status=400,
        )


class DataBrowseView(View):
    template = 'browse_upload.html'

    def get(self, request):
        params = {'fields': RawCatch.allowed_query_fields()}
        return render(request, self.template, params)


class EditNormalizeView(View):
    template = 'edit_normalize.html'

    def get(self, request):

        page = int(request.GET.get('page', 1))
        last_page = RawCatch.objects.from_request(request).last_page()

        params = {'page': page, 'pages': list(range(1, last_page + 1))}
        if page > 1:
            params['previous_page'] = page - 1
        if page < last_page:
            params['next_page'] = page + 1
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
            RawCatch.bulk_save(simplejson.loads(request.body)['data'])
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
