from time import strftime
from django.db import models
from django.db.transaction import atomic
from django.contrib.auth.models import User
import os


def upload_file_path(instance, filename):
    return os.path.join('recon_files', strftime('%Y%m%d'), filename)


class FileUpload(models.Model):
    file = models.FileField(upload_to=upload_file_path)
    user = models.ForeignKey(to=User, null=True)
    create_datetime = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'file_upload'

    def __str__(self):
        return self.file.name


class RawCatch(models.Model):
    fishing_entity = models.CharField(max_length=200, null=True)
    fishing_entity_id = models.IntegerField(default=0)
    original_country_fishing = models.CharField(max_length=200, null=True)
    original_country_fishing_id = models.IntegerField(null=True)
    eez = models.CharField(max_length=200, null=True)
    eez_id = models.IntegerField(default=0)
    eez_sub_area = models.CharField(max_length=200, null=True)
    fao_area = models.CharField(max_length=20, null=True)
    fao_area_id = models.IntegerField(null=True)
    subregional_area = models.CharField(max_length=200, null=True)
    province_state = models.CharField(max_length=200, null=True)
    ices_division = models.CharField(max_length=200, null=True)
    ices_division_id = models.IntegerField(null=True)
    ices_subdivision = models.CharField(max_length=200, null=True)
    ices_subdivision_id = models.IntegerField(null=True)
    nafo_division = models.CharField(max_length=200, null=True)
    nafo_division_id = models.IntegerField(null=True)
    ccamlr_area = models.CharField(max_length=200, null=True)
    layer = models.IntegerField(default=0)
    sector = models.CharField(max_length=200, null=True)
    sector_id = models.IntegerField(default=0)
    original_sector = models.CharField(max_length=200, null=True)
    catch_type = models.CharField(max_length=200, null=True)
    catch_type_id = models.IntegerField(default=0)
    year = models.IntegerField(default=0)
    taxon_name = models.CharField(max_length=200, null=True)
    taxon_id = models.IntegerField(default=0)
    original_taxon_name = models.CharField(max_length=200, null=True)
    original_taxon_name_id = models.IntegerField(null=True)
    original_fao_name = models.CharField(max_length=200, null=True)
    original_fao_name_id = models.IntegerField(null=True)
    amount = models.DecimalField(max_digits=20, decimal_places=12)
    adjustment_factor = models.DecimalField(max_digits=20, decimal_places=12, null=True)
    gear_type = models.CharField(max_length=200, null=True)
    gear_type_id = models.IntegerField(null=True)
    input_type = models.CharField(max_length=200, null=True)
    input_type_id = models.IntegerField(null=True)
    forward_carry_rule = models.CharField(max_length=200, null=True)
    forward_carry_rule_id = models.IntegerField(null=True)
    disaggregation_rule = models.CharField(max_length=200, null=True)
    disaggregation_rule_id = models.IntegerField(null=True)
    layer_rule = models.CharField(max_length=200, null=True)
    layer_rule_id = models.IntegerField(null=True)
    reference_id = models.IntegerField(null=True)
    notes = models.TextField(null=True)
    user = models.ForeignKey(to=User)
    source_file = models.ForeignKey(to=FileUpload)

    class Meta:
        db_table = 'raw_catch'

    @staticmethod
    @atomic
    def commit(file_id):
        pass  # TODO

    @classmethod
    def update(cls, file_id, id, column, old_value, new_value):
        obj = cls.objects.get(id=id, source_file_id=file_id)
        column_name = cls.get_column_name(column)
        setattr(obj, column_name, new_value)
        obj.save()
        obj.refresh_from_db()
        return {
            'field': column_name,
            'old': old_value,
            'newValue': getattr(obj, column_name)
        }

    @classmethod
    @atomic
    def bulk_save(cls, file_id, changes):
        for row in changes:
            obj = cls.objects.filter(id=row[0], source_file_id=file_id)
            values = {cls.get_column_name(idx): col for idx, col in enumerate(row) if idx > 0}
            obj.update(**values)

    @classmethod
    def get_column_name(cls, col_num):
        try:
            return cls.fields()[col_num]
        except IndexError:
            return None

    @classmethod
    def fields(cls):
        return list(map(lambda x: x.name, cls._meta.fields))[:-2]

    @staticmethod
    def required_fields():
        return [
            'fishing_entity',
            'eez',
            'year',
            'taxon_name',
            'amount'
        ]  # TODO get real required fields
