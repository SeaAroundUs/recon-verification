import os
from time import strftime
from django.db import models
from django.contrib.auth.models import User


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
    def update(id, column, old_value, new_value):
        obj = RawCatch.objects.get(id=id)
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
    def get_column_name(col_num):
        try:
            return [
                'id',
                'fishing_entity',
                'original_country_fishing',
                'fishing_entity_id',
                'eez_area',
                'eez_sub_area',
                'eez_area_id',
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
                'gear_type',
                'gear_type_id',
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
            'fishing_entity_id',
            'EEZ',
            'EEZ Subarea',
            'eez_area_id',
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
            # 'gear_type_id',
            'Sector',
            'Original Sector',
            'sector_id',
            'Catch Type',
            'catch_type_id',
            'Input',
            'Forward Carry Rule',
            'reference_id',
            'Notes'
        ]
