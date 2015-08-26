from django.db import models
from data_ingest.models import RawCatch


class FishingEntity(models.Model):
    fishing_entity_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=200)

    class Meta:
        verbose_name_plural = 'Fishing Entities'
        db_table = 'fishing_entity'
        ordering = ['name']
        managed = False

    def __str__(self):
        return u"{0} - {1}".format(self.fishing_entity_id, self.name)


class EEZ(models.Model):
    eez_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=200)
    alternate_name = models.CharField(max_length=200)
    fishing_entity = models.ForeignKey(to=FishingEntity, db_column='is_home_eez_of_fishing_entity_id')

    class Meta:
        verbose_name = 'EEZ'
        verbose_name_plural = 'EEZs'
        db_table = 'eez'
        ordering = ['name']
        managed = False

    def __str__(self):
        return u"{0} - {1}".format(self.eez_id, self.name)


class FAO(models.Model):
    fao_area_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=200)
    alternate_name = models.CharField(max_length=200)

    class Meta:
        verbose_name = 'FAO'
        verbose_name_plural = 'FAOs'
        db_table = 'fao_area'
        ordering = ['name']
        managed = False

    def __str__(self):
        return u"{0} - {1}".format(self.fao_area_id, self.name)


class ICESArea(models.Model):
    ices_area_id = models.IntegerField(primary_key=True)
    ices_area = models.CharField(max_length=50)

    class Meta:
        verbose_name = 'ICES Area'
        verbose_name_plural = 'ICES Areas'
        db_table = 'ices_area'
        managed = False

    def __str__(self):
        return u"{0} - {1}".format(self.ices_area_id, self.ices_area)


class NAFO(models.Model):
    nafo_division_id = models.IntegerField(primary_key=True)
    nafo_division = models.CharField(max_length=200)

    class Meta:
        verbose_name = 'NAFO Division'
        verbose_name_plural = 'NAFO Divisions'
        db_table = 'nafo'
        managed = False

    def __str__(self):
        return u"{0} - {1}".format(self.nafo_id, self.nafo_division)


class Sector(models.Model):
    sector_type_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=200)

    class Meta:
        db_table = 'sector_type'
        managed = False

    def __str__(self):
        return u"{0}".format(self.name)


class CatchType(models.Model):
    catch_type_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=200)

    class Meta:
        db_table = 'catch_type'
        managed = False

    def __str__(self):
        return u"{0}".format(self.name)


class Taxon(models.Model):
    taxon_key = models.IntegerField(primary_key=True)
    common_name = models.CharField(max_length=255)
    scientific_name = models.CharField(max_length=255)

    class Meta:
        verbose_name_plural = 'Taxa'
        ordering = ['common_name', 'scientific_name']
        db_table = 'taxon'
        managed = False

    def __str__(self):
        return u"{0} - {1}  ({2})".format(self.taxon_key, self.scientific_name, self.common_name)


class Gear(models.Model):
    gear_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=200)

    class Meta:
        db_table = 'gear'
        managed = False


class InputType(models.Model):
    input_type_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=200)

    class Meta:
        db_table = 'input_type'
        managed = False

    def __str__(self):
        return u"{0}".format(self.name)


class Reference(models.Model):
    reference_id = models.IntegerField(primary_key=True)
    reference = models.CharField(max_length=200)

    class Meta:
        db_table = 'reference'
        managed = False

    def __str__(self):
        return u"{0}".format(self.name)


class Year(models.Model):
    id = models.IntegerField(db_column='time_key', primary_key=True)
    year = models.IntegerField()

    class Meta:
        db_table = 'time'
        managed = False

    def __str__(self):
        return u"{0}".format(self.year)

    @classmethod
    def valid_years(cls):
        return cls.objects.values_list('year', flat=True)


class Catch(models.Model):
    fishing_entity = models.ForeignKey(to=FishingEntity, related_name='+')
    original_country_fishing = models.ForeignKey(to=FishingEntity, related_name='+', null=True)
    eez = models.ForeignKey(to=EEZ)
    eez_sub_area = models.CharField(max_length=200, null=True)
    fao_area = models.ForeignKey(to=FAO)
    subregional_area = models.CharField(max_length=200, null=True)
    province_state = models.CharField(max_length=200, null=True)
    ices_area = models.ForeignKey(to=ICESArea, related_name='+', null=True)
    nafo_division = models.ForeignKey(to=NAFO, null=True)
    ccamlr_area = models.CharField(max_length=200, null=True)
    layer = models.IntegerField(default=0)
    sector = models.ForeignKey(to=Sector, db_column='sector_type_id')
    original_sector = models.CharField(max_length=200, null=True)
    catch_type = models.ForeignKey(to=CatchType)
    year = models.IntegerField(default=0)
    taxon = models.ForeignKey(to=Taxon, db_column='taxon_key', related_name='+')
    original_taxon_name = models.ForeignKey(to=Taxon, related_name='+', null=True)
    original_fao_name = models.ForeignKey(to=Taxon, related_name='+', null=True)
    amount = models.DecimalField(max_digits=20, decimal_places=12)
    adjustment_factor = models.DecimalField(max_digits=20, decimal_places=12, null=True)
    gear_type = models.ForeignKey(to=Gear, null=True)
    input_type = models.ForeignKey(to=InputType)
    forward_carry_rule_id = models.IntegerField(default=0, null=True)  # TODO relate to forward_carry_rule table
    disaggregation_rule_id = models.IntegerField(default=0, null=True)  # TODO relate to disaggregation_rule table
    layer_rule_id = models.IntegerField(default=0, null=True)  # TODO relate to layer_rule table
    reference = models.ForeignKey(to=Reference, null=True)
    notes = models.TextField(null=True)
    raw_catch = models.ForeignKey(to=RawCatch)

    class Meta:
        db_table = 'catch'
        managed = False
