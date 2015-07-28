from collections import OrderedDict
from data_ingest.models import FileUpload, RawCatch
from catch.models import FishingEntity, EEZ, FAO, ICESDivision, ICESSubDivision, NAFO, \
    Sector, CatchType, Taxon, Gear, InputType, Reference, Catch
from decimal import Decimal
from datetime import datetime
from django.db.models import F
import xlrd
import re
import time
import logging


logger = logging.getLogger(__name__)


class ContributedFile:
    def __init__(self, contributed_file, user):
        self.user = user
        self.contributed_file = contributed_file

        new_name = re.sub(r'(\.[^\.]+)$', r'%s\1' % str(time.time()).split('.')[0], contributed_file.name)
        contributed_file.name = new_name
        fileupload = FileUpload(file=self.contributed_file.name, user=self.user)
        fileupload.save()  # TODO don't save row until file is 100% loaded (and also saved in S3?)

        self.fileupload_id = FileUpload.objects.latest('id').id
        self.excel_file_dict = {}

    def _convert_to_dict(self, sheet):
        fields = sheet.row_values(0)
        return (OrderedDict(zip(fields, sheet.row_values(rx))) for rx in range(1, sheet.nrows))

    def _process_excel_file(self):
        book = xlrd.open_workbook(
            file_contents=self.contributed_file.read(),
            encoding_override='utf-8'
        )
        for sheet in book.sheets():
            self.excel_file_dict[sheet.name] = self._convert_to_dict(sheet)

    def _insert_reconstruction_data(self):
        raw_catches = []
        source_file = FileUpload.objects.get(id=self.fileupload_id)
        user = self.user

        # iterate over every row in the file
        for recon_datum in self.excel_file_dict['Catch Data']:
            kwargs = {key.lower().strip().replace(' ', '_'): val for (key, val) in recon_datum.items()}

            # add special fields
            kwargs.update({'user': user, 'source_file': source_file})

            # ensure decimal fields are properly typed
            for decimal_field in ('amount', 'adjustment_factor'):
                val = kwargs[decimal_field]
                if isinstance(val, str):
                    val = val.strip()
                kwargs[decimal_field] = Decimal(val) if val else None

            # throw the row in the pile
            raw_catches.append(RawCatch(**kwargs))

        # create all the rows
        RawCatch.objects.bulk_create(raw_catches)

    def process(self):
        self._process_excel_file()
        if 'Catch Data' in self.excel_file_dict:  # TODO need better check here
            self._insert_reconstruction_data()
        else:
            pass  # TODO raise some kind of error here

def get_warnings(ids):
    warnings = []
    for idx, row in enumerate(RawCatch.objects.filter(id__in=ids).order_by('id')):

        if row.eez_id != 0 and row.fishing_entity_id != 0 and row.layer != 0:
            eez_owner = EEZ.objects.get(eez_id=row.eez_id).fishing_entity
            expected_layer = 1 if eez_owner.fishing_entity_id == row.fishing_entity_id else 2
            # TODO layer 3 logic based on taxon
            if row.layer != expected_layer:
                warnings.append({'row': idx, 'col': 'layer', 'reason': 'Unexpected layer per rule'})

        if row.input_type_id == 2 and row.catch_type_id == 3:
            warnings.append({'row': idx, 'col': 'input_type_id', 'reason': 'Input type/catch type mismatch'})

    # TODO more warnings

    return warnings

def get_errors(ids):
    errors = []
    for idx, row in enumerate(RawCatch.objects.filter(id__in=ids).order_by('id')):

        if row.input_type_id == 1 and row.catch_type_id == 1:
            errors.append({'row': idx, 'col': 'input_type',  'reason': 'Input type/catch type mismatch'})

        if row.input_type_id in [2, 4, 5, 6] and row.catch_type_id in [2, 3]:
            errors.append({'row': idx, 'col': 'input_type',  'reason': 'Input type/catch type mismatch'})

        if row.layer not in [1, 2, 3]:
            errors.append({'row': idx, 'col': 'layer', 'reason': 'Unknown layer'})

        id_fields = [
            'taxon_key',
            'original_taxon_name_id',
            'original_fao_name_id',
            'catch_type_id',
            'fishing_entity_id',
            'original_country_fishing_id',
            'eez_id',
            'fao_area_id',
            'sector_type_id',
            'input_type_id',
        ]

        for field in id_fields:
            if getattr(row, field) == 0:
                errors.append({'row': idx, 'col': field,  'reason': 'Unknown value'})

        for field in RawCatch.required_fields():
            if not str(getattr(row, field)).strip():
                errors.append({'row': idx, 'col': field,  'reason': 'Required field is empty'})

    return errors

def get_committed_ids(ids):
    return list(RawCatch.objects.filter(
        id__in=ids,
        last_committed__lte=F('last_modified')
    ).order_by('id').values_list('id', flat=True))

def normalize(ids):
    for row in RawCatch.objects.filter(id__in=ids).order_by('id'):
        try:
            taxon = Taxon.objects.filter(scientific_name__iexact=row.taxon_name.strip())[0]
            row.taxon_key = taxon.taxon_key
        except IndexError:  # no Taxon found
            row.taxon_key = 0

        if row.original_taxon_name:
            try:
                original_taxon = Taxon.objects.filter(scientific_name__iexact=row.original_taxon_name.strip())[0]
                row.original_taxon_name_id = original_taxon.taxon_key
            except IndexError:  # no Taxon found
                row.original_taxon_name_id = 0
        else:
            row.original_taxon_name_id = None

        if row.original_fao_name:
            try:
                original_fao = Taxon.objects.filter(scientific_name__iexact=row.original_fao_name.strip())[0]
                row.original_fao_name_id = original_fao.taxon_key
            except IndexError:  # no Taxon found
                row.original_fao_name_id = 0
        else:
            row.original_fao_name_id = None

        try:
            catch_type = CatchType.objects.get(name__iexact=row.catch_type.strip())
            row.catch_type_id = catch_type.catch_type_id
        except CatchType.DoesNotExist:  # no CatchType found
            row.catch_type_id = 0

        try:
            fishing_entity = FishingEntity.objects.get(name__iexact=row.fishing_entity.strip())
            row.fishing_entity_id = fishing_entity.fishing_entity_id
        except FishingEntity.DoesNotExist:  # no Country found
            row.fishing_entity_id = 0

        if row.original_country_fishing:
            try:
                original_country_fishing = FishingEntity.objects.get(name__iexact=row.original_country_fishing.strip())
                row.original_country_fishing_id = original_country_fishing.fishing_entity_id
            except FishingEntity.DoesNotExist:  # no Country found
                row.original_country_fishing_id = 0
        else:
            row.original_country_fishing_id = None

        try:
            eez = EEZ.objects.get(name__iexact=row.eez.strip())
            row.eez_id = eez.eez_id
        except EEZ.DoesNotExist:  # no EEZ found
            row.eez_id = 0

        try:
            fao_area = FAO.objects.get(name__iexact=row.fao_area.strip())
            row.fao_area_id = fao_area.fao_area_id
        except FAO.DoesNotExist:  # no FAO found
            row.fao_area_id = 0

        try:
            sector = Sector.objects.get(name__iexact=row.sector.strip())
            row.sector_type_id = sector.sector_type_id
        except Sector.DoesNotExist:  # no Sector found
            row.sector_type_id = 0

        try:
            input_type = InputType.objects.get(name__iexact=row.input_type.strip())
            row.input_type_id = input_type.input_type_id
        except InputType.DoesNotExist:  # no Input Type found
            row.input_type_id = 0

        if row.eez_id != 0 and row.fishing_entity_id != 0 and row.layer == 0:
            eez_owner = EEZ.objects.get(eez_id=row.eez_id).fishing_entity
            row.layer = 1 if eez_owner.fishing_entity_id == row.fishing_entity_id else 2

        # TODO more normalization

        # only save rows that change
        if row.is_dirty():
            row.last_modified = datetime.now()
            row.save()

def commit(ids):
    rows = RawCatch.objects.filter(id__in=ids)
    for row in rows:
        # required values
        values = {
            'fishing_entity': FishingEntity.objects.get(fishing_entity_id=row.fishing_entity_id),
            'eez': EEZ.objects.get(eez_id=row.eez_id),
            'fao_area': FAO.objects.get(fao_area_id=row.fao_area_id),
            'layer': row.layer,
            'sector': Sector.objects.get(sector_type_id=row.sector_type_id),
            'catch_type': CatchType.objects.get(catch_type_id=row.catch_type_id),
            'year': row.year,
            'taxon': Taxon.objects.get(taxon_key=row.taxon_key),
            'amount': row.amount,
            'raw_catch': row
        }
        # TODO input type

        # optional flat values
        values.update({
            'eez_sub_area': row.eez_sub_area,
            'subregional_area': row.subregional_area,
            'province_state': row.province_state,
            'ccamlr_area': row.ccamlr_area,
            'original_sector': row.original_sector,
            'adjustment_factor': row.adjustment_factor,
            'notes': row.notes
        })

        # optional relations
        try:
            values.update({'original_country_fishing': FishingEntity.objects.get(fishing_entity_id=row.original_country_fishing_id)})
        except FishingEntity.DoesNotExist:
            values.update({'original_country_fishing': None})

        try:
            values.update({'ices_division': ICESDivision.objects.get(ices_division_id=row.ices_division_id)})
        except ICESDivision.DoesNotExist:
            values.update({'ices_division': None})

        try:
            values.update({'ices_subdivision': ICESSubDivision.objects.get(ices_subdivision_id=row.ices_subdivision_id)})
        except ICESSubDivision.DoesNotExist:
            values.update({'ices_subdivision': None})

        try:
            values.update({'nafo_division': NAFO.objects.get(nafo_division_id=row.nafo_division_id)})
        except NAFO.DoesNotExist:
            values.update({'nafo_division': None})

        try:
            values.update({'original_taxon_name': Taxon.objects.get(taxon_key=row.original_taxon_name_id)})
        except Taxon.DoesNotExist:
            values.update({'original_taxon_name': None})

        try:
            values.update({'original_fao_name': Taxon.objects.get(taxon_key=row.original_fao_name_id)})
        except Taxon.DoesNotExist:
            values.update({'original_fao_name': None})

        try:
            values.update({'gear_type': Gear.objects.get(gear_id=row.gear_type_id)})
        except Gear.DoesNotExist:
            values.update({'gear_type': None})

        # TODO forward_carry_rule
        # TODO disaggregation_rule
        # TODO layer_rule

        try:
            values.update({'reference': Reference.objects.get(reference_id=row.reference_id)})
        except Reference.DoesNotExist:
            values.update({'reference': None})

        try:
            catch = Catch.objects.get(raw_catch_id=row.id)
            for field, value in values.items():
                setattr(catch, field, value)
        except Catch.DoesNotExist:
            catch = Catch(**values)

        catch.save()

        row.last_committed = datetime.now()
        row.save()
