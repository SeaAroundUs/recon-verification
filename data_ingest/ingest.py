from data_ingest.models import FileUpload, RawCatch
from catch.models import FishingEntity, EEZ, FAO, ICESArea, NAFO, \
    Sector, CatchType, ReportingStatus, Taxon, Gear, InputType, Reference, Catch, Year
from .warning_error import RawCatchLookupMismatch, RawCatchMissingRequiredField
from decimal import Decimal
from django.forms import ValidationError
from django.utils import timezone
from django.db import connection
from django.db.models import F
from .util import IteratorFile
from itertools import repeat
import xlrd
import re
import time
import logging


logger = logging.getLogger(__name__)


# this class handles the uploaded spreadsheet
class ContributedFile:
    def __init__(self, contributed_file, user, ref_id, comment=None):
        self.user = user
        self.ref_id = ref_id
        self.contributed_file = contributed_file

        new_name = re.sub(r'(\.[^\.]+)$', r'%s\1' % str(time.time()).split('.')[0], contributed_file.name)
        contributed_file.name = new_name
        self.source_file = FileUpload(file=self.contributed_file.name, user=self.user, comment=comment)

        book = xlrd.open_workbook(
            file_contents=self.contributed_file.read(),
            encoding_override='utf-8'
        )
        sheet = book.sheet_by_index(0)

        if sheet.row_values(0) == RawCatch.template_fields():
            self.source_file.save()
            self._insert_recon_data(sheet)
        else:
            raise ValidationError('uploaded file does not match template')

    # this breaks apart the sheet into a clean data iterator for insertion into the DB.
    # it recasts some data types below
    def _get_data_iterator(self, sheet):
        for rx in range(1, sheet.nrows):
            row_values = sheet.row_values(rx)
            args = row_values[:10] + [self.ref_id] + row_values[10:] + [self.user.id, self.source_file.id]

            # cast decimal columns
            for f in ['amount', 'adjustment_factor']:
                i = RawCatch.inserted_fields().index(f)
                val = args[i]
                args[i] = Decimal(val.strip() if isinstance(val, str) else val) if val else None

            # cast integer columns
            for f in ['layer', 'year']:
                i = RawCatch.inserted_fields().index(f)
                val = args[i]
                args[i] = int(val.strip() if isinstance(val, str) else val) if val else None

            yield ('\t'.join(repeat('{}', len(args))) + '\n').format(*args)

    # this method physically inserts the data into the DB
    def _insert_recon_data(self, sheet):
        with connection.cursor() as cursor:
            cursor.copy_from(IteratorFile(self._get_data_iterator(sheet)),
                             'raw_catch',
                             sep='\t',
                             null='None',
                             columns=RawCatch.inserted_fields())


# given a list of raw_catch ids, this returns a list of hashes for all warnings found
# warnings are driven by v_raw_catch_ views
def get_warnings(ids):
    warnings = []
    for view in RawCatch.warning_views():
        warnings += [{'row': ids.index(row[0]), 'col': view.col, 'reason': view.message} for row in view.any(ids)]
    return warnings


# given a list of raw_catch ids, this returns a list of hashes for all errors found
# errors are partially driven by RawCatch.warning_views() views, and partially driven by logic here
def get_errors(ids):
    errors = []
    # this iterator uses RawCatch.error_views() to drive the error checking
    for view in (set(RawCatch.error_views()) - {RawCatchLookupMismatch, RawCatchMissingRequiredField}):
        errors += [{'row': ids.index(row[0]), 'col': view.col, 'reason': view.message} for row in view.any(ids)]

    # lines below are non-view error checking
    for idx, row in enumerate(RawCatch.objects.filter(id__in=ids).order_by('id')):
        # Lookup table mismatch
        # we check for errors here by seeing if the value is 0. zero means the normalization
        # process couldn't match a value to a row in the db.
        # ex: taxon_name is checked against the db in normalization. a miss results in a zero
        # in the taxon_key field which is flagged here as an error
        id_fields = [
            'taxon_key',
            'catch_type_id',
            'reporting_status_id',
            'fishing_entity_id',
            'fao_area_id',
            'sector_type_id',
            'input_type_id',
            'reference_id'
        ]
        for field in id_fields:
            if getattr(row, field) == 0:
                errors.append({'row': idx, 'col': field,  'reason': 'Lookup table mismatch'})

        # Lookup table mismatch (EEZ)
        # we check EEZ separately because zero is a legit EEZ so we check for NULL (None in Python) here
        try:
            EEZ.objects.get(eez_id=row.eez_id)
        except EEZ.DoesNotExist:
            errors.append({'row': idx, 'col': 'eez_id', 'reason': 'Lookup table mismatch'})

        # Lookup table mismatch (year)
        # here we check that the given year is an OK one
        if row.year not in Year.valid_years():
            errors.append({'row': idx, 'col': 'year', 'reason': 'Lookup table mismatch'})

        # Missing required field
        # here we check for require fields (listed by RawCatch.required_fields()) that are empty
        for field in RawCatch.required_fields():
            if not str(getattr(row, field)).strip():
                errors.append({'row': idx, 'col': field,  'reason': 'Missing required field'})
    return errors


# this method returns a list of rows in raw_catch that have not been changed since they were committed
# NOTE: if this functionality is acting funny make sure the database has timezones set up correctly
def get_committed_ids(ids):
    return list(RawCatch.objects.filter(
        id__in=ids,
        last_committed__lte=F('last_modified')
    ).exclude(
        last_committed__isnull=True
    ).order_by('id').values_list('id', flat=True))


# this is the normalization method that handles checking the data against the db and
# recording the ids in the proper fields
def normalize(ids, source_file_id=None):
    number_of_ids = len(ids)
    batch_size = 5000

    with connection.cursor() as cursor:
        for i in range(0, number_of_ids, batch_size):
            normalize_query = ("SELECT recon.normalize_raw_catch_by_ids('{%s}'::INT[]);"
                               % ','.join(map(str, ids[i:i+batch_size])))
            cursor.execute(normalize_query)
            records_processed_sofar = (i+1) * batch_size

# this method handles committing data from raw_catch to catch
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
            'reporting_status': ReportingStatus.objects.get(reporting_status_id=row.reporting_status_id),
            'year': row.year,
            'taxon': Taxon.objects.get(taxon_key=row.taxon_key),
            'amount': row.amount,
			'gear_type': Gear.objects.get(gear_id=row.gear_id),
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
            'notes': row.notes,
			'taxon_notes': row.taxon_notes,
			'gear_notes': row.gear_notes
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

        #
        # Check for this column is deferred until we have a proper FAO taxon lookup table created and populated in the db
        #
        # try:
        #     values.update({'original_fao_name': Taxon.objects.get(taxon_key=row.original_fao_name_id)})
        # except Taxon.DoesNotExist:
        #     values.update({'original_fao_name': None})

        #try:
        #    values.update({'gear_type': Gear.objects.get(gear_id=row.gear_type_id)})
        #except Gear.DoesNotExist:
        #    values.update({'gear_type': None})

        # never got rules for these, but making models for the appropriate db tables and replicating
        # the above logic should handle things fine
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

        # quick patch to have the reference_id column in the recon.catch table be populated with reference_id instead of
        # the row_id from the reference table.
        # TODO if there's a better to have the reference_id pushed to the recon.catch table, this code should be retired
        if catch.reference != None:
            catch.reference_id = row.reference_id

        catch.save()

        row.last_committed = timezone.now()
        row.save()
