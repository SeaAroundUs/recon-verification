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
