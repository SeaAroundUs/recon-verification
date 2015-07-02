from django.shortcuts import render
from django.views.generic.base import View
from django.views.generic.edit import CreateView
from django.http import HttpResponse, HttpResponseNotFound
from data_ingest.models import FileUpload, RawCatch
from data_ingest.forms import FileUploadForm
from data_ingest.ingest import normalize
import logging
import simplejson


logger = logging.getLogger(__name__)


class ReconResponse(object):
    def __new__(cls, payload):
        return HttpResponse(simplejson.dumps(payload, use_decimal=True), content_type='application/json')


def get_raw_catch_data(file_id):
    raw_data = RawCatch.objects.filter(source_file_id=file_id).order_by('id')
    raw_data_list = {'data': []}
    for data_row in raw_data:
        raw_data_list['data'].append(list(getattr(data_row, field) for field in RawCatch.fields()))
    return raw_data_list


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
        files = FileUpload.objects.exclude(user_id=None).order_by('create_datetime')
        return render(request, self.template, {'files': files})


class EditNormalizeView(View):
    template = 'edit_normalize.html'

    def get(self, request, file_id):
        return render(request, self.template, {'file_id': file_id})


class CatchFieldsJsonView(View):
    def get(self, request):
        return ReconResponse(RawCatch.fields())


class UploadDataJsonView(View):
    def get(self, request, file_id):
        if file_id is None or not RawCatch.objects.filter(source_file_id=file_id).exists():
            return HttpResponseNotFound()
        else:
            return ReconResponse(get_raw_catch_data(file_id=file_id))

    def post(self, request, file_id):
        # data changes come in as a list-of-lists, each of which is of the form: [row, column, before, after]
        # NOTE: row and column are zero-based
        data_changes = simplejson.loads(request.body)

        try:
            if isinstance(data_changes['data'][0], list):
                RawCatch.bulk_save(file_id, data_changes['data'])
                return ReconResponse({'result': 'ok'})

            else:
                for data_change in data_changes['data']:
                        changed_data = RawCatch.update(file_id, **data_change)
                        response = {'result': 'ok'}
                        response.update(changed_data)
                        return ReconResponse(response)

        except Exception as e:
            return ReconResponse({'result': 'not ok', 'exception': e.__str__()})


class DataNormalizationView(View):
    def post(self, request, file_id):
        normalize(file_id=file_id)
        return ReconResponse(get_raw_catch_data(file_id=file_id))


class CommitView(View):
    def post(self, request, file_id):
        try:
            RawCatch.commit(file_id)
            return ReconResponse({'result': 'ok'})
        except Exception as e:  # TODO more specific exception?
            return ReconResponse({'result': 'not ok', 'exception': e.__str__()})
