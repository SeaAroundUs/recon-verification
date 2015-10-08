from collections import OrderedDict
from data_ingest.models import FileUpload, RawCatch
from catch.models import FishingEntity, EEZ, FAO, ICESArea, NAFO, \
    Sector, CatchType, Taxon, Gear, InputType, Reference, Catch, Year
from decimal import Decimal
from django.forms import ValidationError
from django.utils import timezone
from django.db.models import F
import xlrd
import re
import time
import logging


logger = logging.getLogger(__name__)


class ContributedFile:
    def __init__(self, contributed_file, user, ref_id):
        self.user = user
        self.ref_id = ref_id
        self.contributed_file = contributed_file

        new_name = re.sub(r'(\.[^\.]+)$', r'%s\1' % str(time.time()).split('.')[0], contributed_file.name)
        contributed_file.name = new_name
        source_file = FileUpload(file=self.contributed_file.name, user=self.user)

        self._process_excel_file()
        if self._is_valid():
            source_file.save()
            self._insert_reconstruction_data(source_file)
        else:
            source_file.delete()
            raise ValidationError('uploaded file does not match template')

    def _is_valid(self):
        return list(self.excel_data[0].keys()) == RawCatch.template_fields()

    def _convert_to_dict(self, sheet):
        fields = list(map(str.strip, sheet.row_values(0)))
        return list(OrderedDict(zip(fields, sheet.row_values(rx))) for rx in range(1, sheet.nrows))

    def _process_excel_file(self):
        book = xlrd.open_workbook(
            file_contents=self.contributed_file.read(),
            encoding_override='utf-8'
        )
        sheet = book.sheet_by_index(0)
        self.excel_data = self._convert_to_dict(sheet)

    def _insert_reconstruction_data(self, source_file):
        raw_catches = []
        user = self.user
        ref_id = self.ref_id

        # iterate over every row in the file
        for recon_datum in self.excel_data:
            kwargs = {
                key.lower().strip().replace(' ', '_'): val if val != '' else None
                for (key, val) in recon_datum.items()
            }

            # add special fields
            kwargs.update({'user': user, 'source_file': source_file, 'reference_id': ref_id})

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

        if row.year > 2010:
            warnings.append({'row': idx, 'col': 'year', 'reason': 'Year after 2010'})

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

        if row.year not in Year.valid_years():
            errors.append({'row': idx, 'col': 'year', 'reason': 'Invalid year'})

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
            'reference_id'
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
    ).exclude(
        last_committed__isnull=True
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
            except IndexError:  # no FAO found
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

        try:
            Reference.objects.get(reference_id=row.reference_id)
        except Reference.DoesNotExist:  # no Reference found
            row.reference_id = 0

        # TODO more normalization

        # only save rows that change
        if row.is_dirty():
            row.last_modified = timezone.now()
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
            'input_type': InputType.objects.get(input_type_id=row.input_type_id),
            'raw_catch': row
        }

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
            values.update({'ices_area': ICESArea.objects.get(ices_area_id=row.ices_area_id)})
        except ICESArea.DoesNotExist:
            values.update({'ices_area': None})

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

        row.last_committed = timezone.now()
        row.save()
