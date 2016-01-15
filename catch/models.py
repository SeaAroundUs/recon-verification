from django.db import models
from django.contrib.postgres.fields import ArrayField
from django.contrib import admin
from data_ingest.models import RawCatch
from django.core.exceptions import ValidationError
from django.core.validators import MinValueValidator, MaxValueValidator
from django.contrib.auth.models import User
from catch.logging import TableEdit
from data_ingest.util import NullableCharField, NullableTextField
from data_ingest.warning_error import *
import re


# subclass this inside a model to enable admin editing
class LoggedAdmin(admin.ModelAdmin):
    def save_model(self, request, obj, form, change):
        obj.save()
        if change:
            TableEdit.log_update(request.user, obj._meta.db_table, 1)
        else:
            TableEdit.log_insert(request.user, obj._meta.db_table, 1)

    def delete_model(self, request, obj):
        obj.delete()
        TableEdit.log_delete(request.user, obj._meta.db_table, 1)


# models represent tables in the db
class GeoEntity(models.Model):
    # the following assignments are informing the model to the table columns
    geo_entity_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50)
    admin_geo_entity_id = models.IntegerField()
    jurisdiction_id = models.IntegerField(null=True, blank=True)
    started_eez_at = models.CharField(max_length=50, null=True, blank=True)
    legacy_c_number = models.IntegerField()
    legacy_admin_c_number = models.IntegerField()

    # this meta section gives additional context to django about the table
    class Meta:
        verbose_name = 'Geo entity'
        verbose_name_plural = 'Geo entities'
        db_table = 'geo_entity'
        ordering = ['geo_entity_id']
        managed = False

    # this admin subclass is used by the admin editing section
    class Admin(LoggedAdmin):
        list_display = (
            'geo_entity_id',
            'name'
        )
        search_fields = ['name']
        show_full_result_count = True

    # the __str__ method tell django how to display an instance of this class as a string
    def __str__(self):
        return self.name


class FishingEntity(models.Model):
    fishing_entity_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=100)
    geo_entity = models.ForeignKey(to=GeoEntity, null=True, blank=True)
    date_allowed_to_fish_other_eezs = models.IntegerField()
    date_allowed_to_fish_high_seas = models.IntegerField()
    legacy_c_number = models.IntegerField(null=True, blank=True)
    is_currently_used_for_web = models.BooleanField(default=True)
    is_currently_used_for_reconstruction = models.BooleanField(default=True)
    remarks = models.CharField(max_length=50, null=True, blank=True)

    class Meta:
        verbose_name = 'Fishing entity'
        verbose_name_plural = 'Fishing entities'
        db_table = 'fishing_entity'
        ordering = ['fishing_entity_id']
        managed = False

    class Admin(LoggedAdmin):
        list_display = (
            'fishing_entity_id',
            'name'
        )
        list_filter = ('is_currently_used_for_web',)
        search_fields = ['name']
        show_full_result_count = True

    def __str__(self):
        return self.name


class EEZ(models.Model):
    eez_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=200)
    alternate_name = models.CharField(max_length=200, null=True, blank=True)
    geo_entity_id = models.IntegerField()
    area_status_id = models.IntegerField(default=2)
    legacy_c_number = models.IntegerField()
    legacy_count_code = models.IntegerField()
    fishbase_id = models.CharField(max_length=4)
    coords = models.CharField(max_length=400, null=True, blank=True)
    can_be_displayed_on_web = models.BooleanField(default=True)
    is_currently_used_for_web = models.BooleanField(default=False)
    is_currently_used_for_reconstruction = models.BooleanField(default=False)
    declaration_year = models.IntegerField(default=1982)
    earliest_access_agreement_date = models.IntegerField(null=True, blank=True)
    fishing_entity = models.ForeignKey(to=FishingEntity, db_column='is_home_eez_of_fishing_entity_id')
    allows_coastal_fishing_for_layer2_data = models.BooleanField()
    ohi_link = models.CharField(max_length=400, null=True, blank=True)

    class Meta:
        verbose_name = 'EEZ'
        verbose_name_plural = 'EEZs'
        db_table = 'eez'
        ordering = ['eez_id']
        managed = False

    class Admin(LoggedAdmin):
        list_display = (
            'eez_id',
            'name',
            'fishing_entity'
        )
        list_filter = ('is_currently_used_for_web',)
        search_fields = ['name', 'fishing_entity__name']
        show_full_result_count = True

    def __str__(self):
        return self.name


class FAO(models.Model):
    fao_area_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=200)
    alternate_name = models.CharField(max_length=200)

    class Meta:
        verbose_name = 'FAO'
        verbose_name_plural = 'FAOs'
        db_table = 'fao_area'
        ordering = ['fao_area_id']
        managed = False

    class Admin(LoggedAdmin):
        list_display = (
            'fao_area_id',
            'name'
        )
        search_fields = ['name']
        show_full_result_count = True

    def __str__(self):
        return self.name


class ICESArea(models.Model):
    ices_area_id = models.IntegerField(primary_key=True)
    ices_area = models.CharField(max_length=50)

    class Meta:
        verbose_name = 'ICES Area'
        verbose_name_plural = 'ICES Areas'
        db_table = 'ices_area'
        ordering = ['ices_area_id']
        managed = False

    class Admin(LoggedAdmin):
        list_display = (
            'ices_area_id',
            'ices_area'
        )
        search_fields = ['ices_area']
        show_full_result_count = True

    def __str__(self):
        return self.ices_area


class NAFO(models.Model):
    nafo_division_id = models.IntegerField(primary_key=True)
    nafo_division = models.CharField(max_length=200)

    class Meta:
        verbose_name = 'NAFO Division'
        verbose_name_plural = 'NAFO Divisions'
        db_table = 'nafo'
        managed = False

    class Admin(LoggedAdmin):
        list_display = (
            'nafo_division_id',
            'nafo_division'
        )
        search_fields = ['nafo_division']
        show_full_result_count = True

    def __str__(self):
        return self.nafo_division


class Sector(models.Model):
    sector_type_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=200)

    class Meta:
        verbose_name = 'Sector type'
        verbose_name_plural = 'Sector types'
        db_table = 'sector_type'
        managed = False

    class Admin(LoggedAdmin):
        list_display = (
            'sector_type_id',
            'name'
        )
        show_full_result_count = True

    def __str__(self):
        return self.name


class CatchType(models.Model):
    catch_type_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=200)

    class Meta:
        verbose_name = 'Catch type'
        verbose_name_plural = 'Catch types'
        db_table = 'catch_type'
        managed = False

    class Admin(LoggedAdmin):
        list_display = (
            'catch_type_id',
            'name'
        )
        show_full_result_count = True

    def __str__(self):
        return self.name


class CommercialGroup(models.Model):
    commercial_group_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=100)

    class Meta:
        verbose_name = 'Commercial group'
        verbose_name_plural = 'Commercial groups'
        db_table = 'commercial_groups'
        ordering = ['commercial_group_id']
        managed = False

    class Admin(LoggedAdmin):
        list_display = (
            'commercial_group_id',
            'name'
        )
        show_full_result_count = True

    def __str__(self):
        return self.name


class FunctionalGroup(models.Model):
    functional_group_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=20)
    description = models.CharField(max_length=50, null=True, blank=True)
    target_grp = models.IntegerField(null=True, blank=True)

    class Meta:
        verbose_name = 'Functional group'
        verbose_name_plural = 'Functional groups'
        db_table = 'functional_groups'
        ordering = ['functional_group_id']
        managed = False

    class Admin(LoggedAdmin):
        list_display = (
            'functional_group_id',
            'name'
        )
        show_full_result_count = True

    def __str__(self):
        return self.name


class TaxonGroup(models.Model):
    taxon_group_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=100)
    description = models.TextField(null=True, blank=True)

    class Meta:
        verbose_name = 'Taxon group'
        verbose_name_plural = 'Taxon groups'
        db_table = 'taxon_group'
        ordering = ['taxon_group_id']
        managed = False

    class Admin(LoggedAdmin):
        list_display = (
            'taxon_group_id',
            'name'
        )
        show_full_result_count = True

    def __str__(self):
        return self.name


class TaxonLevel(models.Model):
    taxon_level_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=100)
    description = models.TextField(null=True, blank=True)

    class Meta:
        verbose_name = 'Taxon level'
        verbose_name_plural = 'Taxon levels'
        db_table = 'taxon_level'
        ordering = ['taxon_level_id']
        managed = False

    class Admin(LoggedAdmin):
        list_display = (
            'taxon_level_id',
            'name'
        )
        show_full_result_count = True

    def __str__(self):
        return self.name


class Taxon(models.Model):
    taxon_key = models.IntegerField(primary_key=True)
    scientific_name = models.CharField(max_length=255)
    common_name = models.CharField(max_length=255)
    commercial_group = models.ForeignKey(to=CommercialGroup)
    functional_group = models.ForeignKey(to=FunctionalGroup)
    sl_max = models.IntegerField()
    tl = models.DecimalField(max_digits=50, decimal_places=20)
    taxon_level = models.ForeignKey(to=TaxonLevel, null=True, blank=True)
    taxon_group = models.ForeignKey(to=TaxonGroup, null=True, blank=True)
    isscaap_id = models.IntegerField(null=True, blank=True)  # TODO FK?
    lat_north = models.IntegerField(null=True, blank=True)
    lat_south = models.IntegerField(null=True, blank=True)
    min_depth = models.IntegerField(null=True, blank=True)
    max_depth = models.IntegerField(null=True, blank=True)
    loo = models.DecimalField(max_digits=50, decimal_places=20, null=True, blank=True)
    woo = models.DecimalField(max_digits=50, decimal_places=20, null=True, blank=True)
    k = models.DecimalField(max_digits=50, decimal_places=20, null=True, blank=True)
    x_min = models.IntegerField(null=True, blank=True)
    x_max = models.IntegerField(null=True, blank=True)
    y_min = models.IntegerField(null=True, blank=True)
    y_max = models.IntegerField(null=True, blank=True)
    has_habitat_index = models.BooleanField()
    has_map = models.BooleanField()
    is_baltic_only = models.BooleanField()

    @property
    def is_rare(self):
        try:
            RareTaxon.objects.get(taxon_key=self.taxon_key)
            return True
        except RareTaxon.DoesNotExist:
            return False

    class Meta:
        verbose_name = 'Taxon'
        verbose_name_plural = 'Taxa'
        ordering = ['common_name', 'scientific_name']
        db_table = 'taxon'
        managed = False

    class Admin(LoggedAdmin):
        list_display = (
            'taxon_key',
            'common_name',
            'scientific_name'
        )
        search_fields = ['taxon_key', 'common_name', 'scientific_name']
        show_full_result_count = True

    def __str__(self):
        return self.common_name


class Gear(models.Model):
    gear_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=200)

    class Meta:
        ordering = ['gear_id']
        db_table = 'gear'
        managed = False

    def __str__(self):
        return self.name


class InputType(models.Model):
    input_type_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=200)

    class Meta:
        ordering = ['input_type_id']
        db_table = 'input_type'
        managed = False

    def __str__(self):
        return self.name


class Reference(models.Model):
    reference_id = models.AutoField(primary_key=True)
    filename = models.CharField(max_length=200)

    class Meta:
        db_table = 'reference'
        managed = False

    class Admin(LoggedAdmin):
        list_display = (
            'reference_id',
            'filename'
        )
        search_fields = ['filename']
        show_full_result_count = True

    def __str__(self):
        return self.filename


class Year(models.Model):
    id = models.IntegerField(db_column='time_key', primary_key=True)
    year = models.IntegerField()

    class Meta:
        ordering = ['id']
        db_table = 'time'
        managed = False

    def __str__(self):
        return self.name

    @classmethod
    def valid_years(cls):
        return cls.objects.values_list('year', flat=True)

    @classmethod
    def max_year(cls):
        return cls.objects.aggregate(models.Max('year'))['year__max']


class Catch(models.Model):
    fishing_entity = models.ForeignKey(to=FishingEntity, related_name='+')
    original_country_fishing = models.ForeignKey(to=FishingEntity, related_name='+', null=True)
    eez = models.ForeignKey(to=EEZ)
    eez_sub_area = NullableCharField(max_length=200, null=True)
    fao_area = models.ForeignKey(to=FAO)
    subregional_area = NullableCharField(max_length=200, null=True)
    province_state = NullableCharField(max_length=200, null=True)
    ices_area = models.ForeignKey(to=ICESArea, related_name='+', null=True)
    nafo_division = models.ForeignKey(to=NAFO, null=True)
    ccamlr_area = NullableCharField(max_length=200, null=True)
    layer = models.IntegerField(default=0)
    sector = models.ForeignKey(to=Sector, db_column='sector_type_id')
    original_sector = NullableCharField(max_length=200, null=True)
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
    notes = NullableTextField(null=True)
    raw_catch = models.ForeignKey(to=RawCatch)

    class Meta:
        db_table = 'catch'
        managed = False

    @staticmethod
    def warning_views():
        return [cls for cls in CatchMixin.__subclasses__() if cls.type == "warning"]

    @staticmethod
    def error_views():
        return [cls for cls in CatchMixin.__subclasses__() if cls.type == "error"]


class AccessType(models.Model):
    id = models.AutoField(primary_key=True)
    description = models.TextField()

    class Meta:
        verbose_name = 'Access type'
        verbose_name_plural = 'Access types'
        ordering = ['id']
        db_table = 'access_type'
        managed = False

    class Admin(LoggedAdmin):
        list_display = (
            'id',
            'description'
        )
        search_fields = ['description']
        show_full_result_count = True

    def __str__(self):
        return self.description


class AgreementType(models.Model):
    id = models.IntegerField(primary_key=True)
    description = models.TextField()

    class Meta:
        verbose_name = 'Agreement type'
        verbose_name_plural = 'Agreement types'
        ordering = ['id']
        db_table = 'agreement_type'
        managed = False

    class Admin(LoggedAdmin):
        list_display = (
            'id',
            'description'
        )
        search_fields = ['description']
        show_full_result_count = True

    def __str__(self):
        return self.description


def aa_functional_group_validator(value):
    if not re.search('^\d+$|^(\d+;)+\d+$', value):
        raise ValidationError('Expected a semicolon separated list or a single value')
    fg_ids = FunctionalGroup.objects.values_list('functional_group_id', flat=True)
    if len(list(fg_id for fg_id in value.split(';') if int(fg_id) not in fg_ids)):
        raise ValidationError('One or more functional group IDs are not valid')


class AccessAgreement(models.Model):
    id = models.AutoField(primary_key=True)
    fishing_entity = models.ForeignKey(to=FishingEntity)
    eez = models.ForeignKey(to=EEZ)
    title_of_agreement = models.CharField(max_length=255)
    access_category = models.CharField(max_length=255)
    access_type = models.ForeignKey(to=AccessType)
    agreement_type = models.ForeignKey(to=AgreementType)
    start_year = models.IntegerField(
        validators=[
            MinValueValidator(1890, message='Min allowable year is 1890'),
            MaxValueValidator(2013, message='Max allowable year is 2013')
        ]
    )
    end_year = models.IntegerField(
        validators=[
            MinValueValidator(1950, message='Min allowable year is 1950'),
            MaxValueValidator(9999, message='Max allowable year is 9999')
        ]
    )
    duration_type = models.CharField(max_length=255, null=True, blank=True)
    duration_details = models.CharField(max_length=255, null=True, blank=True)
    functional_group_id = models.CharField(
        max_length=255, null=True, blank=True, validators=[aa_functional_group_validator]
    )
    functional_group_details = models.CharField(max_length=255, null=True, blank=True)
    fees = models.CharField(max_length=255, null=True, blank=True)
    quotas = models.CharField(max_length=255, null=True, blank=True)
    other_restrictions = models.CharField(max_length=255, null=True, blank=True)
    notes_on_agreement = models.CharField(max_length=255, null=True, blank=True)
    ref_id = models.IntegerField(null=True, blank=True)
    source_link = models.CharField(max_length=255, null=True, blank=True)
    pdf = models.CharField(max_length=255, null=True, blank=True)
    verified = models.CharField(max_length=255, null=True, blank=True)
    reference_original = models.CharField(max_length=255, null=True, blank=True)
    location_reference_original = models.CharField(max_length=255, null=True, blank=True)
    reference = models.CharField(max_length=255, null=True, blank=True)
    title_of_reference = models.CharField(max_length=255, null=True, blank=True)
    location_reference = models.CharField(max_length=255, null=True, blank=True)
    reference_type = models.CharField(max_length=255, null=True, blank=True)
    pages = models.CharField(max_length=255, null=True, blank=True)
    number_of_boats = models.CharField(max_length=255, null=True, blank=True)
    gear = models.CharField(max_length=255, null=True, blank=True)
    notes_on_the_references = models.CharField(max_length=255, null=True, blank=True)
    change_log = models.CharField(max_length=255, null=True, blank=True)

    class Meta:
        verbose_name = 'Access agreement'
        verbose_name_plural = 'Access agreements'
        ordering = ['id']
        db_table = 'access_agreement'
        managed = False

    class Admin(LoggedAdmin):
        list_display = (
            'id',
            'fishing_entity',
            'eez',
            'title_of_agreement',
            'access_type',
            'agreement_type',
            'start_year',
            'end_year'
        )
        list_filter = ('access_type',)
        search_fields = ['fishing_entity__name', 'eez__name', 'title_of_agreement']
        show_full_result_count = True

    def __str__(self):
        return self.title_of_agreement or "(None)"


class RareTaxon(models.Model):
    taxon_key = models.IntegerField(primary_key=True)
    scientific_name = models.CharField(max_length=255)
    common_name = models.CharField(max_length=255)

    class Meta:
        verbose_name = 'Rare taxon'
        verbose_name_plural = 'Rare taxa'
        ordering = ['common_name']
        db_table = 'rare_taxon'
        managed = False

    class Admin(LoggedAdmin):
        list_display = ('taxon_key', 'scientific_name', 'common_name')
        search_fields = ('scientific_name', 'common_name')
        show_full_result_count = True


class Layer3Taxon(models.Model):
    taxon_key = models.IntegerField(primary_key=True)
    scientific_name = models.CharField(max_length=255)
    common_name = models.CharField(max_length=255)

    class Meta:
        verbose_name = 'Layer 3 taxon'
        verbose_name_plural = 'Layer 3 taxa'
        ordering = ['common_name']
        db_table = 'layer3_taxon'
        managed = False

    class Admin(LoggedAdmin):
        list_display = ('taxon_key', 'scientific_name', 'common_name')
        search_fields = ('scientific_name', 'common_name')
        show_full_result_count = True


class HabitatIndex(models.Model):
    taxon_key = models.IntegerField(primary_key=True)
    taxon_name = models.CharField(max_length=255, null=True, blank=True)
    common_name = models.CharField(max_length=255, null=True, blank=True)
    cla_code = models.IntegerField(null=True, blank=True)
    ord_code = models.IntegerField(null=True, blank=True)
    fam_code = models.IntegerField(null=True, blank=True)
    gen_code = models.IntegerField(null=True, blank=True)
    spe_code = models.IntegerField(null=True, blank=True)
    habitat_diversity_index = models.FloatField(null=True, blank=True)
    effective_distance = models.FloatField(null=True, blank=True)
    estuaries = models.FloatField(null=True, blank=True)
    coral = models.FloatField(null=True, blank=True)
    sea_grass = models.FloatField(null=True, blank=True)
    others = models.FloatField(null=True, blank=True)
    shelf = models.FloatField(null=True, blank=True)
    slope = models.FloatField(null=True, blank=True)
    abyssal = models.FloatField(null=True, blank=True)
    inshore = models.FloatField(null=True, blank=True)
    offshore = models.FloatField(null=True, blank=True)
    offshore_back = models.FloatField(null=True, blank=True)
    max_depth = models.IntegerField(null=True, blank=True)
    min_depth = models.IntegerField(null=True, blank=True)
    lat_north = models.IntegerField(null=True, blank=True)
    lat_south = models.IntegerField(null=True, blank=True)
    found_in_fao_area_id = ArrayField(models.IntegerField(null=True, blank=True), null=True, blank=True)
    fao_limits = models.IntegerField(null=True, blank=True)
    sl_max = models.IntegerField(null=True, blank=True)
    intertidal = models.NullBooleanField(null=True, blank=True)

    class Meta:
        verbose_name = 'Habitat index'
        verbose_name_plural = 'Habitat indices'
        ordering = ['common_name']
        db_table = 'taxon_habitat'
        managed = False

    class Admin(LoggedAdmin):
        list_display = ('taxon_key', 'taxon_name', 'common_name')
        search_fields = ('taxon_name', 'common_name')
        show_full_result_count = True


class LME(models.Model):
    lme_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50)
    profile_url = models.CharField(max_length=255, default='http://www.lme.noaa.gov/')

    class Meta:
        verbose_name = 'LME'
        verbose_name_plural = 'LMEs'
        ordering = ['name']
        db_table = 'lme'
        managed = False

    class Admin(LoggedAdmin):
        list_display = ('lme_id', 'name', 'profile_url')
        search_fields = ('name',)
        show_full_result_count = True


class RFMO(models.Model):
    rfmo_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50)
    long_name = models.CharField(max_length=255)
    profile_url = models.CharField(max_length=255, null=True, blank=True)

    class Meta:
        verbose_name = 'RFMO'
        verbose_name_plural = 'RFMOs'
        ordering = ['name']
        db_table = 'rfmo'
        managed = False

    class Admin(LoggedAdmin):
        list_display = ('rfmo_id', 'name', 'long_name', 'profile_url')
        search_fields = ('name', 'long_name')
        show_full_result_count = True


class RFMOManagedTaxon(models.Model):
    rfmo_id = models.IntegerField(primary_key=True)
    primary_taxon_keys = ArrayField(models.IntegerField(null=True, blank=True), null=True, blank=True)
    secondary_taxon_keys = ArrayField(models.IntegerField(null=True, blank=True), null=True, blank=True)
    taxon_check_required = models.BooleanField()

    class Meta:
        verbose_name = 'RFMO managed taxon'
        verbose_name_plural = 'RFMO managed taxa'
        ordering = ['rfmo_id']
        db_table = 'rfmo_managed_taxon'
        managed = False

    class Admin(LoggedAdmin):
        list_display = ('rfmo_id',)
        show_full_result_count = True


class HighSeas(models.Model):
    fao_area_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50)
    alternate_name = models.CharField(max_length=50, blank=True, null=True)

    class Meta:
        verbose_name = 'High sea'
        verbose_name_plural = 'High seas'
        ordering = ['fao_area_id']
        db_table = 'high_seas'
        managed = False

    class Admin(LoggedAdmin):
        list_display = ('fao_area_id', 'name', 'alternate_name')
        show_full_result_count = True


class TaxonSubstitution(models.Model):
    original_taxon_key = models.IntegerField(primary_key=True)
    use_this_taxon_key_instead = models.IntegerField()

    class Meta:
        verbose_name = 'Taxon substitution'
        verbose_name_plural = 'Taxon substitution'
        ordering = ['original_taxon_key', 'use_this_taxon_key_instead']
        db_table = 'taxon_distribution_substitute'
        managed = False

    class Admin(LoggedAdmin):
        list_display = ('original_taxon_key', 'use_this_taxon_key_instead')
        show_full_result_count = True

    @classmethod
    def get_subs(cls):
        return dict(cls.objects.all().values_list('original_taxon_key', 'use_this_taxon_key_instead'))


class AdHocQuery(models.Model):
    query = models.TextField()
    notes = models.TextField(null=True, blank=True)
    is_active = models.BooleanField(default=True)
    created_by_auth_user = models.ForeignKey(to=User, related_name='+')
    reviewed_by_auth_user = models.ForeignKey(to=User, null=True, blank=True, related_name='+')
    grantee_auth_user_id = ArrayField(models.IntegerField(), null=True, blank=True)
    last_executed_by_auth_user = models.ForeignKey(to=User, null=True, blank=True, related_name='+')
    last_executed = models.DateTimeField(null=True, blank=True)
    created = models.DateTimeField(auto_now_add=True)
    last_modified = models.DateTimeField(auto_now=True)

    @classmethod
    def get_for_view(cls, user, query_id=None):
        queries = cls.objects.filter(is_active=True)
        if not user.is_superuser:
            queries = queries.filter(
                    models.Q(grantee_auth_user_id__contain=[user.id]) | models.Q(created_by_auth_user=user))
        if query_id is not None:
            queries = queries.filter(id=query_id)
        return queries.all()

    def approved_users(self):
        return None if self.grantee_auth_user_id is None \
            else User.objects.filter(id__in=list(self.grantee_auth_user_id)).all()

    class Meta:
        verbose_name = 'Query'
        verbose_name_plural = 'Queries'
        ordering = ['last_executed', 'created']
        db_table = 'adhoc_query'
        managed = False

    class Admin(LoggedAdmin):
        list_display = ('query', 'notes', 'is_active', 'created_by_auth_user', 'reviewed_by_auth_user')
        search_fields = ('query', 'notes')
        list_filter = ('is_active',)
        exclude = (
            'created_by_auth_user',
            'reviewed_by_auth_user',
            'grantee_auth_user_id',
            'last_executed_by_auth_user',
            'last_executed',
            'created',
            'last_modified')
        show_full_result_count = True

        def save_model(self, request, obj, form, change):
            if not change:
                obj.created_by_auth_user = request.user
            super().save_model(request, obj, form, change)
