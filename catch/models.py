from django.db import models
from data_ingest.models import RawCatch


class Reference(models.Model):
    name = models.CharField(max_length=200)

    class Meta:
        db_table = 'reference'


class Country(models.Model):
    name = models.CharField(max_length=200)

    class Meta:
        verbose_name_plural = 'Countries'
        db_table = 'country'
        ordering = ['name']

    def __str__(self):
        return u"{0} - {1}".format(self.id, self.name)


class EEZ(models.Model):
    country = models.ForeignKey(to=Country)
    name = models.CharField(max_length=200)

    class Meta:
        verbose_name = 'EEZ'
        verbose_name_plural = 'EEZs'
        db_table = 'eez'
        ordering = ['name']

    def __str__(self):
        return u"{0} - {1}".format(self.id, self.name)


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


class Catch(models.Model):
    year = models.IntegerField()
    amount = models.DecimalField(max_digits=20, decimal_places=12)
    raw_catch = models.ForeignKey(to=RawCatch)
    fishing_entity = models.ForeignKey(to=Country, related_name="fishing_entity")
    original_country_fishing = models.ForeignKey(to=Country, related_name="original_country_fishing")
    eez = models.ForeignKey(to=EEZ)
    fao_area = models.CharField(max_length=20, null=True)
    sub_regional_area = models.CharField(max_length=200, null=True)
    province_state = models.CharField(max_length=200, null=True)
    ices_division = models.CharField(max_length=20, null=True)
    ices_subdivision = models.CharField(max_length=20, null=True)
    nafo_division = models.CharField(max_length=20, null=True)
    ccamlr_area = models.CharField(max_length=20, null=True)
    taxon = models.ForeignKey(to=Taxon)
    sector = models.ForeignKey(to=Sector)
    catch_type = models.ForeignKey(to=CatchType)
    input_type = models.CharField(max_length=200, null=True)
    reference_id = models.IntegerField(null=True)
    forward_carry_rule = models.CharField(max_length=400, null=True)
    adjustment_factor = models.CharField(max_length=200, null=True)
    # gear = models.CharField(max_length=200, null=True)
    notes = models.CharField(max_length=2000, null=True)

    class Meta:
        db_table = 'reconstructed_catch'