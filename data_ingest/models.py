from time import strftime
from django.db.transaction import atomic
from django.contrib.auth.models import User
from catch.models import *
from reconstruction_verification.settings import ROWS_PER_PAGE
import os


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


class RawCatch(models.Model):
    fishing_entity = models.CharField(max_length=200, null=True)
    fishing_entity_id = models.IntegerField(default=0)
    original_country_fishing = models.CharField(max_length=200, null=True)
    original_country_fishing_id = models.IntegerField(null=True)
    eez = models.CharField(max_length=200, null=True)
    eez_id = models.IntegerField(default=0)
    eez_sub_area = models.CharField(max_length=200, null=True)
    fao_area = models.CharField(max_length=200)
    fao_area_id = models.IntegerField(default=0)
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
    sector_type_id = models.IntegerField(default=0)
    original_sector = models.CharField(max_length=200, null=True)
    catch_type = models.CharField(max_length=200, null=True)
    catch_type_id = models.IntegerField(default=0)
    year = models.IntegerField(default=0)
    taxon_name = models.CharField(max_length=200, null=True)
    taxon_key = models.IntegerField(default=0)
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
    last_committed = models.DateTimeField(null=True)

    class Meta:
        db_table = 'raw_catch'
        managed = False

    @classmethod
    @atomic
    def commit(cls, ids):
        rows = cls.objects.get(ids__in=ids)
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
            values.update({})  # TODO

            new_catch = Catch(values)
            new_catch.save()

    @classmethod
    def update(cls, id, column, old_value, new_value):
        obj = cls.objects.get(id=id)
        column_name = cls.get_column_name(column)
        setattr(obj, column_name, new_value)
        obj.save()

    @classmethod
    @atomic
    def bulk_save(cls, changes):
        for row in changes:
            obj = cls.objects.filter(id=row[0])
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
        return list(map(lambda x: x.name, cls._meta.fields))[:-3]

    @classmethod
    def last_page(cls, file_id):
        return (cls.objects.filter(source_file_id=file_id).count() // ROWS_PER_PAGE) + 1

    @staticmethod
    def required_fields():
        return [
            'fishing_entity',
            'eez',
            'year',
            'taxon_name',
            'amount'
        ]  # TODO get real required fields
