import os
from time import strftime
from django.db import models, transaction
from django.contrib.auth.models import User
import catch.models


def upload_file_path(instance, filename):
    return os.path.join('recon_files', strftime('%Y%m%d'), filename)


class FileUpload(models.Model):
    file = models.FileField(upload_to=upload_file_path)
    user = models.ForeignKey(to=User, null=True)
    create_datetime = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.file.name


class RawCatch(models.Model):
    source_file = models.ForeignKey(to=FileUpload)
    user = models.ForeignKey(to=User)
    fishing_entity = models.CharField(max_length=200)
    fishing_entity_id = models.IntegerField(default=0)
    original_country_fishing = models.CharField(max_length=200)
    eez_area = models.CharField(max_length=200)
    eez_id = models.IntegerField(default=0)
    eez_sub_area = models.CharField(max_length=200, null=True)
    fao_area = models.CharField(max_length=20, null=True)
    sub_regional_area = models.CharField(max_length=200, null=True)
    province_state = models.CharField(max_length=200, null=True)
    ices_division = models.CharField(max_length=20, null=True)
    ices_subdivision = models.CharField(max_length=20, null=True)
    nafo_division = models.CharField(max_length=20, null=True)
    ccamlr_area = models.CharField(max_length=20, null=True)
    layer = models.IntegerField()
    year = models.IntegerField()
    amount = models.DecimalField(max_digits=20, decimal_places=12)
    adjustment_factor = models.CharField(max_length=200, null=True)
    gear_type = models.CharField(max_length=200, null=True)
    gear_type_id = models.IntegerField(default=0)
    taxon_name = models.CharField(max_length=200)
    taxon_key = models.IntegerField(default=0)
    original_fao_name = models.CharField(max_length=200, null=True)
    sector = models.CharField(max_length=200)
    original_sector = models.CharField(max_length=200, null=True)
    sector_id = models.IntegerField(default=0)
    catch_type = models.CharField(max_length=200)
    catch_type_id = models.IntegerField(default=0)
    input_type = models.CharField(max_length=200, null=True)
    reference_id = models.IntegerField(null=True)
    forward_carry_rule = models.CharField(max_length=400, null=True)
    notes = models.CharField(max_length=2000, null=True)

    @staticmethod
    def commit(file_id):
        with transaction.atomic():
            for row in RawCatch.objects.filter(source_file=file_id):
                # TODO check for existing row
                values = {
                    'year': row.year,
                    'amount': row.amount,
                    'fao_area': row.fao_area,
                    'sub_regional_area': row.sub_regional_area,
                    'province_state': row.province_state,
                    'ices_division': row.ices_division,
                    'ices_subdivision': row.ices_subdivision,
                    'nafo_division': row.nafo_division,
                    'ccamlr_area': row.ccamlr_area,
                    'input_type': row.input_type,
                    'reference_id': row.reference_id,
                    'forward_carry_rule': row.forward_carry_rule,
                    'adjustment_factor': row.adjustment_factor,
                    # 'gear': catch.models.Gear.objects.get(row.gear_type_id),
                    'notes': row.notes,
                    'catch_type': catch.models.CatchType.objects.get(id=row.catch_type_id),
                    'eez': catch.models.EEZ.objects.get(id=row.eez_id),
                    'fishing_entity': catch.models.Country.objects.get(id=row.fishing_entity_id),
                    'original_country_fishing': catch.models.Country.objects.get(id=2),  # TODO placeholder
                    # 'original_country_fishing': catch.models.Country.objects.get(name=row.original_country_fishing),
                    'raw_catch': row,
                    'sector': catch.models.Sector.objects.get(id=row.sector_id),
                    'taxon': catch.models.Taxon.objects.get(taxon_key=row.taxon_key),
                }
                row = catch.models.Catch(**values)
                row.save()

    @staticmethod
    def update(file_id, id, column, old_value, new_value):
        obj = RawCatch.objects.get(id=id, source_file_id=file_id)
        column_name = RawCatch.get_column_name(column)
        setattr(obj, column_name, new_value)
        obj.save()
        obj.refresh_from_db()
        return {
            'field': column_name,
            'old': old_value,
            'newValue': getattr(obj, column_name)
        }

    @staticmethod
    def bulk_save(file_id, changes):
        for row in changes:
            obj = RawCatch.objects.filter(id=row[0], source_file_id=file_id)
            values = {RawCatch.get_column_name(idx): col for idx, col in enumerate(row) if idx > 0}
            obj.update(**values)

    @staticmethod
    def get_column_name(col_num):
        try:
            return [
                'id',
                'fishing_entity',
                'original_country_fishing',
                'fishing_entity_id',
                'eez_area',
                'eez_sub_area',
                'eez_id',
                'fao_area',
                'sub_regional_area',
                'province_state',
                'ices_division',
                'ices_subdivision',
                'nafo_division',
                'ccamlr_area',
                'layer',
                'year',
                'amount',
                'adjustment_factor',
                'taxon_name',
                'original_fao_name',
                'taxon_key',
                # 'gear_type',
                # 'gear_type_id',
                'sector',
                'original_sector',
                'sector_id',
                'catch_type',
                'catch_type_id',
                'input_type',
                'forward_carry_rule',
                'reference_id',
                'notes'
            ][col_num]
        except IndexError:
            return None


    @staticmethod
    def fields():
        return [
            'id',
            'Fishing Entity',
            'Original Country Fishing',
            'Fishing Entity ID',
            'EEZ',
            'EEZ Subarea',
            'EEZ ID',
            'FAO Area',
            'Subregional Area',
            'Province or State',
            'ICES Division',
            'ICES Subdivision',
            'NAFO Division',
            'CCAMLR Area',
            'Layer',
            'Year',
            'Amount',
            'Adjustment Factor',
            'Taxon Name',
            'Original FAO Name',
            'Taxon Key',
            # 'Gear Type',
            # 'Gear Type ID',
            'Sector',
            'Original Sector',
            'Sector ID',
            'Catch Type',
            'Catch Type ID',
            'Input',
            'Forward Carry Rule',
            'Reference ID',
            'Notes'
        ]
