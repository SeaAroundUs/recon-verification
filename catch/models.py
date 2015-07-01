from django.db import models
from data_ingest.models import RawCatch


class Country(models.Model):
    name = models.CharField(max_length=200)

    class Meta:
        verbose_name_plural = 'Countries'
        db_table = 'country'
        ordering = ['name']

    def __str__(self):
        return u"{0} - {1}".format(self.id, self.name)


class EEZ(models.Model):
    name = models.CharField(max_length=200)
    country = models.ForeignKey(to=Country)

    class Meta:
        verbose_name = 'EEZ'
        verbose_name_plural = 'EEZs'
        db_table = 'eez'
        ordering = ['name']

    def __str__(self):
        return u"{0} - {1}".format(self.id, self.name)


class FAO(models.Model):
    name = models.CharField(max_length=200)

    class Meta:
        verbose_name = 'FAO'
        verbose_name_plural = 'FAOs'
        db_table = 'fao'
        ordering = ['name']

    def __str__(self):
        return u"{0} - {1}".format(self.id, self.name)


class ICES(models.Model):
    name = models.CharField(max_length=200)

    class Meta:
        db_table = 'ices_eez'

    def __str__(self):
        return u"{0} - {1}".format(self.id, self.name)


class NAFO(models.Model):
    name = models.CharField(max_length=200)

    class Meta:
        db_table = 'nafo'

    def __str__(self):
        return u"{0} - {1}".format(self.id, self.name)


class Sector(models.Model):
    name = models.CharField(max_length=200)

    class Meta:
        db_table = 'fishing_sector'

    def __str__(self):
        return u"{0}".format(self.name)


class CatchType(models.Model):
    type = models.CharField(max_length=200)

    class Meta:
        db_table = 'catch_type'

    def __str__(self):
        return u"{0}".format(self.type)


class Taxon(models.Model):
    taxon_key = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=255)
    scientific_name = models.CharField(max_length=255)

    class Meta:
        verbose_name_plural = 'Taxa'
        ordering = ['scientific_name', 'name']
        db_table = 'taxon'

    def __str__(self):
        return u"{0} - {1}  ({2})".format(self.taxon_key, self.scientific_name, self.name)


class Reference(models.Model):
    name = models.CharField(max_length=200)

    class Meta:
        db_table = 'reference'

    def __str__(self):
        return u"{0}".format(self.name)


class Catch(models.Model):
    fishing_entity = models.ForeignKey(to=Country, related_name='+')
    original_country_fishing = models.ForeignKey(to=Country, related_name='+')
    eez = models.ForeignKey(to=EEZ)
    eez_sub_area = models.CharField(max_length=200, null=True)
    fao_area = models.ForeignKey(to=FAO)
    sub_regional_area = models.CharField(max_length=200, null=True)
    province_state = models.CharField(max_length=200, null=True)
    ices_division = models.ForeignKey(to=ICES, related_name='+')
    ices_subdivision = models.ForeignKey(to=ICES, related_name='+')
    nafo_division = models.ForeignKey(to=NAFO)
    ccamlr_area = models.CharField(max_length=200, null=True)
    layer = models.IntegerField(default=0)
    sector = models.ForeignKey(to=Sector)
    original_sector = models.CharField(max_length=200, null=True)
    catch_type = models.ForeignKey(to=CatchType)
    year = models.IntegerField(default=0)
    taxon = models.ForeignKey(to=Taxon, related_name='+')
    original_taxon_name = models.ForeignKey(to=Taxon, related_name='+')
    original_fao_name = models.ForeignKey(to=Taxon, related_name='+')
    amount = models.DecimalField(max_digits=20, decimal_places=12)
    adjustment_factor = models.DecimalField(max_digits=20, decimal_places=12)
    gear_type = models.IntegerField(default=0)  # TODO relate to gear table
    input_type = models.IntegerField(default=0)  # TODO relate to input_type table
    forward_carry_rule = models.IntegerField(default=0)  # TODO relate to forward_carry_rule table
    disaggregation_rule = models.IntegerField(default=0)  # TODO relate to disaggregation_rule table
    layer_rule = models.IntegerField(default=0)  # TODO relate to layer_rule table
    reference_id = models.ForeignKey(to=Reference)
    notes = models.TextField(null=True)
    raw_catch = models.ForeignKey(to=RawCatch)

    class Meta:
        db_table = 'catch'
