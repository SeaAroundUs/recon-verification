import logging
import simplejson
from django.shortcuts import render
from django.views.generic.base import View
from django.views.generic.edit import CreateView
from django.http import HttpResponse, HttpResponseNotFound
from data_ingest.models import FileUpload, RawCatch
from data_ingest.forms import FileUploadForm
from data_ingest.ingest import ingest_file, normalize


logger = logging.getLogger(__name__)


class ReconResponse(object):
    def __new__(cls, payload):
        return HttpResponse(simplejson.dumps(payload, use_decimal=True), content_type='application/json')


def get_raw_catch_data(file_id):
    raw_data = RawCatch.objects.filter(source_file_id=file_id).order_by('id')  # TODO also filter on current user
    raw_data_list = {'data': []}
    for data_row in raw_data:
        raw_data_list['data'].append(
            [
                data_row.id,
                data_row.fishing_entity,
                data_row.original_country_fishing,
                data_row.fishing_entity_id,
                data_row.eez_area,
                data_row.eez_sub_area,
                data_row.eez_id,
                data_row.fao_area,
                data_row.sub_regional_area,
                data_row.province_state,
                data_row.ices_division,
                data_row.ices_subdivision,
                data_row.nafo_division,
                data_row.ccamlr_area,
                data_row.layer,
                data_row.year,
                data_row.amount,
                data_row.adjustment_factor,
                data_row.taxon_name,
                data_row.original_fao_name,
                data_row.taxon_key,
                # data_row.gear_type,
                # data_row.gear_type_id,
                data_row.sector,
                data_row.original_sector,
                data_row.sector_id,
                data_row.catch_type,
                data_row.catch_type_id,
                data_row.input_type,
                data_row.forward_carry_rule,
                data_row.reference_id,
                data_row.notes,
            ])
    return raw_data_list


class FileUploadCreateView(CreateView):
    model = FileUpload
    form_class = FileUploadForm

    def get_form_kwargs(self):
        kwargs = super(FileUploadCreateView, self).get_form_kwargs()
        return kwargs

    def form_valid(self, form):
        # form.instance.user = self.request.user
        # todo:  limit file types and *sizes*?

        data = {
            'files': []
        }
        self.object = form.save()
        file_attributes = getattr(self.object, 'file')

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
        return render(request,
                      self.template,
                      {'files': files})


class EditNormalizeView(View):
    template = 'edit_normalize.html'

    def get(self, request, file_id):
        return render(request,
                      self.template,
                      {'file_id': file_id})


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
        # data changes come in as a list-of-lists, each of which is of the form [row, column, before, after]
        #   row and column are zero-based.
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


class FileIngest(View):
    def get(self, request):
        if request.GET.get('file_path'):
            file_path = request.GET.get('file_path')
            username = request.GET.get('username')
            ingest_file(file_path=file_path,
                        username=username,)
        return HttpResponse()


class CommitView(View):
    def post(self, request, file_id):
        try:
            RawCatch.commit(file_id)
            return ReconResponse({'result': 'ok'})
        except Exception as e:  # TODO more specific exception?
            return ReconResponse({'result': 'not ok', 'exception': e.__str__()})
