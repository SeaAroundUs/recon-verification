from time import strftime
from django.db import models, connection
from django.db.transaction import atomic
from django.contrib.auth.models import User
from reconstruction_verification.settings import ROWS_PER_PAGE
from collections import OrderedDict
from dirtyfields import DirtyFieldsMixin
from django.utils import timezone
from decimal import *
from catch.logging import TableEdit
from .util import NullableCharField, NullableTextField
import os
import logging
import catch.models

logger = logging.getLogger(__name__)


def upload_file_path(instance, filename):
    return os.path.join('recon_files', strftime('%Y%m%d'), filename)


class FileUpload(models.Model):
    file = models.FileField(upload_to=upload_file_path)
    user = models.ForeignKey(to=User, null=True)
    create_datetime = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'file_upload'
        managed = False

    def __str__(self):
        return self.file.name


class RawCatchQuerySet(models.QuerySet):
    def last_page(self):
        return (self.count() // ROWS_PER_PAGE) + 1

    def page(self, page):
        offset = (int(page) - 1) * ROWS_PER_PAGE
        return self.all()[offset:ROWS_PER_PAGE + offset]

    def from_request(self, request):
        allowed_params = [f[0] for f in self.model.allowed_query_fields() if f[0] not in ('warning_view', 'error_view')]
        kwargs = dict((p + '__in', request.GET.getlist(p)) for p in allowed_params if p in request.GET)

        if 'yearRange' in request.GET:
            year_min, year_max = request.GET.get('yearRange').split('-')
            try:
                kwargs['year__gte'] = int(year_min)
            except ValueError:
                pass
            try:
                kwargs['year__lte'] = int(year_max)
            except ValueError:
                pass

        if 'amountRange' in request.GET:
            amount_min, amount_max = request.GET.get('amountRange').split('-')
            try:
                kwargs['amount__gte'] = float(amount_min)
            except ValueError:
                pass
            try:
                kwargs['amount__lte'] = float(amount_max)
            except ValueError:
                pass

        if 'warning_view' in request.GET or 'error_view' in request.GET:
            views = request.GET.getlist('warning_view') + request.GET.getlist('error_view')
            allowed_views = RawCatch.warning_views() + RawCatch.error_views()
            id_sql = ' UNION '.join('SELECT id FROM %s' % ('v_raw_catch_' + view)
                                    for view in views
                                    if view in [_[0] for _ in allowed_views])
            with connection.cursor() as cursor:
                cursor.execute(id_sql)
                kwargs['id__in'] = [_[0] for _ in cursor.fetchall()]

        return self.filter(**kwargs)


class RawCatch(DirtyFieldsMixin, models.Model):
    fishing_entity = models.CharField(max_length=200, null=True)
    fishing_entity_id = models.IntegerField(default=0)
    eez = NullableCharField(max_length=200, null=True)
    eez_id = models.IntegerField(default=0, null=True)
    fao_area = models.CharField(max_length=200)
    fao_area_id = models.IntegerField(default=0)
    layer = models.IntegerField(default=0)
    sector = NullableCharField(max_length=200, null=True)
    sector_type_id = models.IntegerField(default=0)
    catch_type = NullableCharField(max_length=200, null=True)
    catch_type_id = models.IntegerField(default=0)
    year = models.IntegerField(default=0)
    taxon_name = NullableCharField(max_length=200, null=True)
    taxon_key = models.IntegerField(default=0)
    amount = models.DecimalField(max_digits=20, decimal_places=12)
    input_type = NullableCharField(max_length=200, null=True)
    input_type_id = models.IntegerField(null=True)
    reference_id = models.IntegerField(null=True)
    original_country_fishing = NullableCharField(max_length=200, null=True)
    original_country_fishing_id = models.IntegerField(null=True)
    eez_sub_area = NullableCharField(max_length=200, null=True)
    subregional_area = NullableCharField(max_length=200, null=True)
    province_state = NullableCharField(max_length=200, null=True)
    original_sector = NullableCharField(max_length=200, null=True)
    original_taxon_name = NullableCharField(max_length=200, null=True)
    original_taxon_name_id = models.IntegerField(null=True)
    original_fao_name = NullableCharField(max_length=200, null=True)
    original_fao_name_id = models.IntegerField(null=True)
    adjustment_factor = models.DecimalField(max_digits=20, decimal_places=12, null=True)
    gear_type = NullableCharField(max_length=200, null=True)
    gear_type_id = models.IntegerField(null=True)
    forward_carry_rule = NullableCharField(max_length=200, null=True)
    forward_carry_rule_id = models.IntegerField(null=True)
    disaggregation_rule = NullableCharField(max_length=200, null=True)
    disaggregation_rule_id = models.IntegerField(null=True)
    layer_rule = NullableCharField(max_length=200, null=True)
    layer_rule_id = models.IntegerField(null=True)
    notes = NullableTextField(null=True)
    ices_area = NullableCharField(max_length=50, null=True)
    ices_area_id = models.IntegerField(null=True)
    nafo_division = NullableCharField(max_length=200, null=True)
    nafo_division_id = models.IntegerField(null=True)
    ccamlr_area = NullableCharField(max_length=200, null=True)
    user = models.ForeignKey(to=User)
    source_file = models.ForeignKey(to=FileUpload)
    last_committed = models.DateTimeField(null=True)
    last_modified = models.DateTimeField(null=True)

    objects = RawCatchQuerySet.as_manager()

    class Meta:
        db_table = 'raw_catch'
        managed = False

    @classmethod
    @atomic
    def bulk_save(cls, changes, request):
        changed_rows = 0
        for row in changes:
            obj = cls.objects.get(id=row.pop('id'))
            for field, new_value in row.items():
                if field == 'amount' and Decimal.from_float(new_value) == getattr(obj, field):
                    setattr(obj, field, new_value)
                elif field != 'amount':
                    setattr(obj, field, new_value)
            if obj.is_dirty():
                obj.last_modified = timezone.now()
                obj.save()
                changed_rows += 1
        if changed_rows > 0:
            TableEdit.log_update(request.user, 'raw_catch', changed_rows)

    @classmethod
    def fields(cls):
        fields = list(map(lambda x: x.name, cls._meta.fields))[:-4]
        fields.append('delete_row')
        return fields

    def to_dict(self):
        return OrderedDict((field, getattr(self, field, '')) for field in self.fields())

    @staticmethod
    def allowed_query_fields():
        return [
            (
                'fishing_entity_id',
                'Fishing entity',
                catch.models.FishingEntity.objects.order_by('name').values_list('fishing_entity_id', 'name')
            ),
            (
                'eez_id',
                'EEZ',
                catch.models.EEZ.objects.order_by('name').values_list('eez_id', 'name')
            ),
            (
                'fao_area_id',
                'FAO area',
                catch.models.FAO.objects.order_by('name').values_list('fao_area_id', 'name')
            ),
            (
                'layer',
                'Layer',
                list((l,) for l in [1, 2, 3])
            ),
            (
                'sector_type_id',
                'Sector',
                catch.models.Sector.objects.order_by('sector_type_id').values_list('sector_type_id', 'name')
            ),
            (
                'catch_type_id',
                'Catch type',
                catch.models.CatchType.objects.order_by('catch_type_id').values_list('catch_type_id', 'name')
            ),
            (
                'year',
                'Year',
                list((y,) for y in catch.models.Year.valid_years())
            ),
            (
                'taxon_key',
                'Taxon',
                catch.models.Taxon.objects.order_by('scientific_name').values_list('taxon_key', 'scientific_name', 'common_name')
            ),
            (
                'input_type_id',
                'Input type',
                catch.models.InputType.objects.order_by('input_type_id').values_list('input_type_id', 'name')
            ),
            (
                'reference_id',
                'Reference',
                catch.models.Reference.objects.order_by('filename').values_list('reference_id', 'filename')
            ),
            (
                'source_file_id',
                'Source file',
                FileUpload.objects.exclude(user_id__isnull=True).order_by('create_datetime').values_list('id', 'file')
            ),
            (
                'warning_view',
                'Warning',
                RawCatch.warning_views()
            ),
            (
                'error_view',
                'Error',
                RawCatch.error_views()
            )
        ]

    @staticmethod
    def required_fields():
        return [
            'fishing_entity',
            'eez',
            'fao_area',
            'layer',
            'sector',
            'catch_type',
            'year',
            'taxon_name',
            'amount',
            'input_type'
        ]

    @staticmethod
    def template_fields():
        return [
            'fishing entity',
            'EEZ',
            'FAO area',
            'layer',
            'sector',
            'catch type',
            'year',
            'taxon name',
            'amount',
            'input type',
            'original country fishing',
            'EEZ sub area',
            'subregional area',
            'province state',
            'original sector',
            'original taxon name',
            'original FAO name',
            'adjustment factor',
            'gear type',
            'forward carry rule',
            'disaggregation rule',
            'layer rule',
            'notes',
            'ICES area',
            'NAFO division',
            'CCAMLR area'
        ]

    @staticmethod
    def warning_views():
        return [
            ('year_max', 'Year greater than the max year'),
            ('original_taxon_not_null', 'Original taxon name is not null'),
            ('original_country_fishing_not_null', 'Original country fishing is not null'),
            ('original_sector_not_null', 'Original sector is not null'),
            ('peru_catch_amount_greater_than_threshold', 'Catch amount greater than 15e6 for Peru'),
            ('amount_greater_than_threshold', 'Catch amount greater than 5e6 (excluding Peru)'),
            ('fao_27_ices_null', 'FAO is 27 and ICES is null'),
            ('fao_21_nafo_null', 'FAO is 21 and NAFO is null'),
            ('subsistence_and_layer_not_1', 'Sector is subsistence and Layer is not 1'),
            ('layer_2_or_3_and_sector_not_industrial', 'Layer is 2 or 3 and sector is not industrial'),
        ]

    @staticmethod
    def error_views():
        return [
            ('fishing_entity_and_eez_not_aligned', 'Layer is incorrect (determined by EEZ, Fishing Entity, and Taxon)'),
            ('input_reconstructed_catch_type_reported',
             'Input type is reconstructed and Catch type is reported landings'),
            ('input_not_reconstructed_catch_type_not_reported',
             'Input type is not reconstructed and Catch type not reported landings'),
            ('layer_not_in_range', 'Layer is not 1, 2, or 3'),
            ('amount_zero_or_negative', 'Catch amount is zero or negative'),
            ('lookup_mismatch', 'Lookup table mismatch'),
            ('missing_required_field', 'Missing required field'),
            ('taxa_is_rare', 'Rare taxa should be excluded'),
        ]

    @classmethod
    def get_view_count(cls, view):
        with connection.cursor() as cursor:
            cursor.execute('SELECT count(1) FROM %s' % ('v_raw_catch_' + view))
            return cursor.fetchone()[0]

    @classmethod
    def inserted_fields(cls):
        fields = list(field.lower().replace(' ', '_') for field in cls.template_fields())
        return fields[:10] + ['reference_id'] + fields[10:] + ['user_id', 'source_file_id']
