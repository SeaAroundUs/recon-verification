from django.db import models
from django.contrib.postgres.fields import ArrayField
from django.contrib import admin
from data_ingest.models import RawCatch
from django.core.exceptions import ValidationError
from django.core.validators import MinValueValidator, MaxValueValidator
from django.contrib.auth.models import User
from django.utils import timezone
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
class Continent(models.Model):
    code = models.CharField(max_length=2, primary_key=True)
    name = models.CharField(max_length=128)

    class Meta:
        verbose_name = 'Continent'
        verbose_name_plural = 'Continents'
        db_table = 'continent'
        ordering = ['code']
        managed = False

    class Admin(LoggedAdmin):
        list_display = (
            'code',
            'name'
        )
        search_fields = ('code', 'name',)

    def __str__(self):
        return self.name


class GeoEntity(models.Model):
    # the following assignments are informing the model to the table columns
    geo_entity_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50)
    admin_geo_entity_id = models.IntegerField()
    jurisdiction_id = models.IntegerField(null=True, blank=True)
    started_eez_at = models.CharField(max_length=50, null=True, blank=True)
    legacy_c_number = models.IntegerField()
    legacy_admin_c_number = models.IntegerField()
    continent = models.ForeignKey(to=Continent, null=True, blank=True, db_column='continent_code')

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
        search_fields = ('geo_entity_id', 'name',)
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
        search_fields = ('fishing_entity_id', 'name',)
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
    is_retired = models.BooleanField(default=False)
    gsi_link = models.CharField(max_length=400, null=True, blank=True)

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
        search_fields = ('eez_id', 'name', 'fishing_entity__name',)
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
        search_fields = ('name',)
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
        search_fields = ('ices_area_id', 'ices_area',)
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
        search_fields = ('nafo_division',)
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


class ReportingStatus(models.Model):
    reporting_status_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=200)
    abbreviation = models.CharField(max_length=1)

    class Meta:
        verbose_name = 'Reporting Status'
        verbose_name_plural = 'Reporting Statuses'
        db_table = 'reporting_status'
        managed = False

    class Admin(LoggedAdmin):
        list_display = (
            'reporting_status_id',
            'name',
            'abbreviation'
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
    comments_names = models.CharField(null=True, blank=True, max_length=1024)
    commercial_group = models.ForeignKey(to=CommercialGroup)
    functional_group = models.ForeignKey(to=FunctionalGroup)
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
    a = models.FloatField(null=True, blank=True)
    b = models.FloatField(null=True, blank=True)
    sl_max = models.FloatField()
    slbl_max_type = models.CharField(null=True, blank=True, max_length=10)	
    sl_max_2 = models.FloatField(null=True, blank=True)	
    comments_sl_max = models.CharField(null=True, blank=True, max_length=1024)	
    tl = models.DecimalField(max_digits=50, decimal_places=20)
    has_habitat_index = models.BooleanField()   
    se_tl = models.FloatField(null=True, blank=True)
    comments_tl = models.CharField(null=True, blank=True, max_length=1024)
    phylum = models.CharField(null=True, blank=True, max_length=255)
    sub_phylum = models.CharField(null=True, blank=True, max_length=255)
    super_class = models.CharField(null=True, blank=True, max_length=255)
    klass = models.CharField(null=True, blank=True, max_length=255, db_column='class')
    super_order = models.CharField(null=True, blank=True, max_length=255)
    order = models.CharField(null=True, blank=True, max_length=255)
    suborder_infraorder = models.CharField(null=True, blank=True, max_length=255)
    family = models.CharField(null=True, blank=True, max_length=255)
    genus = models.CharField(null=True, blank=True, max_length=255)
    species = models.CharField(null=True, blank=True, max_length=255)
    fb_spec_code = models.IntegerField(null=True, blank=True)
    slb_spec_code = models.IntegerField(null=True, blank=True)
    cla_code = models.IntegerField(null=True, blank=True)
    ord_code = models.IntegerField(null=True, blank=True)
    fam_code = models.IntegerField(null=True, blank=True)
    gen_code = models.IntegerField(null=True, blank=True)
    spe_code = models.IntegerField(null=True, blank=True)	
    slb_cla_code = models.IntegerField(null=True, blank=True)
    slb_ord_code = models.IntegerField(null=True, blank=True)
    slb_fam_code = models.IntegerField(null=True, blank=True)
    slb_gen_code = models.IntegerField(null=True, blank=True)	
    comments_growth = models.CharField(null=True, blank=True, max_length=1024)	
    vulnerability = models.CharField(null=True, blank=True, max_length=1024)	
    resilience = models.CharField(null=True, blank=True, max_length=1024)	
    cell_id = models.IntegerField(null=True, blank=True)	
    super_target = models.IntegerField(null=True, blank=True)	
    has_map = models.BooleanField()	
    map_year = models.IntegerField(null=True, blank=True)	
    is_baltic_only = models.BooleanField()
    is_retired = models.BooleanField()
    is_use = models.NullBooleanField()
    is_taxa_used = models.NullBooleanField()
    is_mariculture_only = models.NullBooleanField()
    updated_by = models.CharField(null=True, blank=True, max_length=255)

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
            'scientific_name',
            'is_retired',
            'lat_north',
            'lat_south',
            'min_depth',
            'max_depth'
        )
        search_fields = ('taxon_key', 'common_name', 'scientific_name',)
        show_full_result_count = True

    # method to return list of error views
    @staticmethod
    def warning_views():
        return sorted([cls for cls in DistributionMixin.__subclasses__() if cls.type == "warning"], key=lambda x: x.message)
    
    @staticmethod
    def error_views():
        return sorted([cls for cls in DistributionMixin.__subclasses__() if cls.type == "error"], key=lambda x: x.message)

    def __str__(self):
        return self.common_name


class Gear(models.Model):
    gear_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=200)
    super_code = models.CharField(max_length=20)
    notes = models.TextField(null=True, blank=True)

    class Meta:
        verbose_name = 'Gear'
        verbose_name_plural = 'Gear'
        ordering = ['gear_id']
        db_table = 'gear'
        managed = False

    class Admin(LoggedAdmin):
        list_display = ('gear_id', 'name')
        search_fields = ('gear_id', 'name',)
        show_full_result_count = True

    def __str__(self):
        return self.name
	
#BEGIN SORTIZ 10/12/18	
class EndUse(models.Model):
    end_use_type_id = models.IntegerField(primary_key=True)
    end_use_name = models.CharField(max_length=200)

    class Meta:
        verbose_name = 'End Use'
        verbose_name_plural = 'End Use'
        ordering = ['end_use_type_id']
        db_table = 'end_use_type'
        managed = False

    class Admin(LoggedAdmin):
        list_display = ('end_use_type_id', 'end_use_name')
        search_fields = ('end_use_type_id', 'end_use_name',)
        show_full_result_count = True

    def __str__(self):
        return self.name		
#END SORTIZ 10/12/18	

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
    class Meta:
        unique_together = (('reference_id', 'marine_layer_id', 'main_area_id'),)

    reference_id = models.DecimalField(max_digits=10, decimal_places=1)
    filename = models.CharField(max_length=300)
    original_ref_id = models.IntegerField(null=True, blank=True)
    marine_layer_id = models.IntegerField()
    main_area_id = models.IntegerField()
    main_area_name = models.CharField(max_length=200)
    end_note_id = models.IntegerField(null=True, blank=True)
    type = models.CharField(max_length=255)
    citation = models.CharField(max_length=700, null=True, blank=True)
    row_id = models.IntegerField(primary_key=True, blank=True, editable=False)

    class Meta:
        db_table = 'reference'
        managed = False

    class Admin(LoggedAdmin):
        list_display = (
            'row_id',
            'reference_id',
            'marine_layer_id',
            'main_area_id',
            'main_area_name',
            'filename',
            'type',
        )
        search_fields = ('reference_id',  'filename', 'main_area_name')
        show_full_result_count = True

    def __str__(self):
        return self.filename


class Year(models.Model):
    id = models.IntegerField(db_column='time_key', primary_key=True, editable=False)
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
    reporting_status = models.ForeignKey(to=ReportingStatus)
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
        return sorted([cls for cls in CatchMixin.__subclasses__() if cls.type == "warning"], key=lambda x: x.message)

    @staticmethod
    def error_views():
        return sorted([cls for cls in CatchMixin.__subclasses__() if cls.type == "error"], key=lambda x: x.message)


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
        search_fields = ('description',)
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
        search_fields = ('description',)
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
    id = models.AutoField(primary_key=True, editable=False)
    fishing_entity = models.ForeignKey(to=FishingEntity)
    eez = models.ForeignKey(to=EEZ)
    title_of_agreement = models.CharField(max_length=255)
    access_category = models.CharField(max_length=255)
    access_type = models.ForeignKey(to=AccessType)
    agreement_type = models.ForeignKey(to=AgreementType)
    start_year = models.IntegerField(
        validators=[
            MinValueValidator(1890, message='Min allowable year is 1890'),
            MaxValueValidator(2019, message='Max allowable year is 2019')
        ]
    )
    end_year = models.IntegerField(
        validators=[
            MinValueValidator(1950, message='Min allowable year is 1950'),
            MaxValueValidator(9999, message='Max allowable year is 9999')
        ]
    )
    duration_type = models.CharField(max_length=255, null=True, blank=True)
    duration_details = models.CharField(max_length=1024, null=True, blank=True)
    functional_group_id = models.CharField(
        max_length=255, null=True, blank=True, validators=[aa_functional_group_validator]
    )
    functional_group_details = models.CharField(max_length=1024, null=True, blank=True)
    fees = models.CharField(max_length=255, null=True, blank=True)
    quotas = models.CharField(max_length=1000, null=True, blank=True)
    other_restrictions = models.CharField(max_length=1024, null=True, blank=True)
    notes_on_agreement = models.CharField(max_length=1024, null=True, blank=True)
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
    notes_on_the_references = models.CharField(max_length=1024, null=True, blank=True)
    change_log = models.CharField(max_length=1024, null=True, blank=True)

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
        search_fields = ('id', 'fishing_entity__name', 'eez__name', 'title_of_agreement',)
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
        search_fields = ('taxon_key', 'scientific_name', 'common_name',)
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
        search_fields = ('taxon_key', 'scientific_name', 'common_name',)
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
    estuaries = models.FloatField(null=True)
    coral = models.FloatField(null=True)
    front = models.FloatField(null=True)
    seagrass = models.FloatField(null=True, blank=True, db_column="sea_grass")
    seamount = models.FloatField(null=True, db_column="sea_mount")
    others = models.FloatField(null=True)
    slope = models.FloatField(null=True)
    shelf = models.FloatField(null=True)
    abyssal = models.FloatField(null=True)
    inshore = models.FloatField(null=True)
    offshore = models.FloatField(null=True)
    max_depth = models.IntegerField(null=True, blank=True)
    min_depth = models.IntegerField(null=True, blank=True)
    true_max_depth = models.IntegerField(null=True, blank=True)
    water_column_position = models.CharField(max_length=255, null=True, blank=True)
    intertidal = models.NullBooleanField(null=True, blank=True)
    lat_north = models.IntegerField(null=True, blank=True)
    lat_south = models.IntegerField(null=True, blank=True)
    found_in_fao_area_id = ArrayField(models.IntegerField(null=True), null=True)
    fao_limits = models.IntegerField(null=True, blank=True)
    sl_max = models.FloatField(null=True, blank=True)
    temperature = models.FloatField(null=True, blank=True)
    general_comments = models.TextField(null=True, blank=True)

    class Meta:
        verbose_name = 'Habitat index'
        verbose_name_plural = 'Habitat indices'
        ordering = ['common_name']
        db_table = 'taxon_habitat'
        managed = False

    class Admin(LoggedAdmin):
        list_display = ('taxon_key', 'taxon_name', 'common_name')
        search_fields = ('taxon_key', 'taxon_name', 'common_name',)
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
        search_fields = ('name', 'lme_id',)
        show_full_result_count = True

    def __str__(self):
        return self.name


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
        search_fields = ('name', 'long_name',)
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
    is_manual_override = models.BooleanField(null=False, default=False)
    comments = models.CharField(max_length=255, null=True, blank=True)

    class Meta:
        verbose_name = 'Taxon substitution'
        verbose_name_plural = 'Taxon substitution'
        ordering = ['original_taxon_key', 'use_this_taxon_key_instead', 'is_manual_override']
        db_table = 'taxon_distribution_substitute'
        managed = False

    class Admin(LoggedAdmin):
        list_display = ('original_taxon_key', 'use_this_taxon_key_instead', 'is_manual_override')
        search_fields = ('original_taxon_key', 'use_this_taxon_key_instead')
        show_full_result_count = True

    @classmethod
    def get_subs(cls):
        #return dict(cls.objects.all().values_list('original_taxon_key', 'use_this_taxon_key_instead', 'is_manual_override'))
        return dict(cls.objects.all().values_list('original_taxon_key', 'use_this_taxon_key_instead'))


class AdHocQuery(models.Model):
    id = models.AutoField(primary_key=True)
    description = models.TextField()
    query = models.TextField()
    requested_by = models.CharField(max_length=100)
    notes = models.TextField(null=True, blank=True)
    estimated_duration = models.DurationField(null=True)
    is_active = models.BooleanField(default=True)
    is_allocated = models.BooleanField(default=False)
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

    def run(self, user):
        if not self.runnable():
            raise Exception('ad hoc query not runnable')
        with connection.cursor() as cursor:
            cursor.execute(self.query)
        self.last_executed_by_auth_user = user
        self.last_executed = timezone.now()
        self.save()
        return True

    def approve(self, user):
        if not self.approveable(user):
            raise Exception('ad hoc query not approveable by current user')
        self.reviewed_by_auth_user = user
        self.save()
        return True

    def authorize(self, user, auth_user):
        if not self.authorizable(user):
            raise Exception('ad hoc query not authorizable by current user')
        if self.grantee_auth_user_id is None:
            self.grantee_auth_user_id = [auth_user.id]
            self.save()
            return True
        elif auth_user.id not in self.grantee_auth_user_id:
            self.grantee_auth_user_id += [auth_user.id]
            self.save()
            return True
        else:
            return False

    def approved_users(self):
        return None if self.grantee_auth_user_id is None \
            else User.objects.filter(id__in=list(self.grantee_auth_user_id)).all()

    def runnable(self):
        return self.reviewed_by_auth_user is not None

    def approveable(self, user):
        return self.reviewed_by_auth_user is None and user.is_superuser

    def authorizable(self, user):
        return user.is_superuser

    class Meta:
        verbose_name = 'Query'
        verbose_name_plural = 'Queries'
        ordering = ['last_executed', 'created']
        db_table = 'adhoc_query'
        managed = False

    class Admin(LoggedAdmin):
        list_display = ('id', 'description', 'requested_by', 'estimated_duration', 'is_allocated', 'created_by_auth_user', 'last_modified')
        search_fields = ('description', 'query', 'requested_by', 'notes',)
        list_filter = ('is_active', 'is_allocated',)
        exclude = (
            'created_by_auth_user',
            'reviewed_by_auth_user',
            'grantee_auth_user_id',
            'last_executed_by_auth_user',
            'last_executed',
            'created')
        show_full_result_count = True

        def save_model(self, request, obj, form, change):
            if not change:
                obj.created_by_auth_user = request.user
            super().save_model(request, obj, form, change)


class Cell(models.Model):
    cell_id = models.IntegerField(primary_key=True)
    lon = models.FloatField()
    lat = models.FloatField()
    cell_row = models.IntegerField()
    cell_col = models.IntegerField()
    total_area = models.FloatField()
    water_area = models.FloatField()
    percent_water = models.FloatField()
    ele_min = models.IntegerField()
    ele_max = models.IntegerField()
    ele_avg = models.IntegerField()
    elevation_min = models.IntegerField()
    elevation_max = models.IntegerField()
    elevation_mean = models.IntegerField()
    bathy_min = models.IntegerField()
    bathy_max = models.IntegerField()
    bathy_mean = models.IntegerField()
    fao_area = models.ForeignKey(to=FAO)
    lme = models.ForeignKey(to=LME)
    bgcp = models.FloatField()
    distance = models.FloatField()
    coastal_prop = models.FloatField()
    shelf = models.FloatField()
    slope = models.FloatField()
    abyssal = models.FloatField()
    estuary = models.FloatField()
    mangrove = models.FloatField()
    seamount_saup = models.FloatField()
    seamount = models.FloatField()
    coral = models.FloatField()
    front = models.FloatField()
    pprod = models.FloatField()
    ice_con = models.FloatField()
    sst = models.FloatField()
    eez_count = models.IntegerField()
    sst_2001 = models.FloatField()
    bt_2001 = models.FloatField()
    pp_10yr_avg = models.FloatField()
    sst_avg = models.FloatField()
    pp_annual = models.FloatField()

    class Meta:
        verbose_name = 'Cell'
        verbose_name_plural = 'Cells'
        ordering = ['cell_id']
        db_table = 'cell'
        managed = False

    class Admin(LoggedAdmin):
        list_display = ('cell_id', 'lat', 'lon', 'lme', 'fao_area')
        list_filter = ('lme', 'fao_area')
        search_fields = ('cell_id',)
        show_full_result_count = True

        def lme(self, obj):
            return obj.lme.name

        def fao_area(self, obj):
            return obj.fao_area.name


class ExcludedTaxon(models.Model):
    taxon_key = models.IntegerField(primary_key=True)
    scientific_name = models.CharField(max_length=255)
    common_name = models.CharField(max_length=255)
    created_timestamp = models.DateTimeField(auto_now_add=True)

    class Meta:
        verbose_name = 'Excluded taxon'
        verbose_name_plural = 'Excluded taxa'
        ordering = ['common_name']
        db_table = 'excluded_taxon'
        managed = False

    class Admin(LoggedAdmin):
        list_display = ('taxon_key', 'scientific_name', 'common_name')
        show_full_result_count = True


class ISSCAAP(models.Model):
    isscaap_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=255)
    is_excluded_group = models.BooleanField(default=False)

    class Meta:
        verbose_name = 'ISSCAAP'
        verbose_name_plural = 'ISSCAAP'
        ordering = ['isscaap_id']
        db_table = 'isscaap'
        managed = False

    class Admin(LoggedAdmin):
        list_display = ('isscaap_id', 'name', 'is_excluded_group')
        list_filter = ('is_excluded_group',)
        show_full_result_count = True


class ProcedureAndOutcome(models.Model):
    rfmo_id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=50)
    area = models.TextField()
    content = models.TextField()
    contracting_parties = models.TextField()
    date_entered_into_force = models.IntegerField(null=True, blank=True)
    fao_association = models.BooleanField()
    fao_statistical_area = models.CharField(max_length=50, null=True, blank=True)
    objectives = models.TextField()
    primary_species = models.TextField()

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'rfmo_procedure_and_outcome'
        managed = False

    class Admin(LoggedAdmin):
        verbose_name = 'Procedure and Outcome'
        verbose_name_plural = 'Procedures and Outcomes'
        list_display = ('rfmo_id', 'name')
        list_filter = ('fao_association',)
        show_full_result_count = True


class UncertaintyTimePeriod(models.Model):
    period_id = models.IntegerField(primary_key=True)
    begin_year = models.IntegerField(null=False)
    end_year = models.IntegerField(null=True)

    def __str__(self):
        if self.end_year:
            return '{}-{}'.format(self.begin_year, self.end_year)
        else:
            return '{}-'.format(self.begin_year)

    class Meta:
        ordering = ['period_id']
        db_table = 'uncertainty_time_period'
        managed = False

    class Admin(LoggedAdmin):
        verbose_name = 'UncertaintyTimePeriod'
        list_display = (
            'period_id',
            'begin_year',
            'end_year'
        )


class UncertaintyScore(models.Model):
    score_id = models.IntegerField(primary_key=True)
    score_name = models.CharField(max_length=30, null=True)
    tolerance = models.IntegerField(null=True)
    ipcc_criteria = models.CharField(max_length=255)

    def __str__(self):
        if self.score_name:
            return self.score_name
        else:
            return str(self.score_id)

    class Meta:
        ordering = ['score_id']
        db_table = 'uncertainty_score'
        managed = False

    class Admin(LoggedAdmin):
        verbose_name = 'UncertaintyScore'
        list_display = (
            'score_id',
            'score_name',
            'tolerance',
            'ipcc_criteria'
        )


class UncertaintyEEZ(models.Model):
    row_id = models.IntegerField(blank=False, primary_key=True)
    eez_id = models.ForeignKey(to=EEZ, editable=True, db_column='eez_id')
    eez_name = models.CharField(max_length=50, editable=False)
    sector_type = models.ForeignKey(to=Sector)
    sector = models.CharField(max_length=50, editable=False)
    period_id = models.ForeignKey(to=UncertaintyTimePeriod, editable=True, db_column='period_id')
    score_id = models.ForeignKey(to=UncertaintyScore,editable=True, db_column='score_id')

    class Meta:
        ordering = ['eez_id']
        db_table = 'uncertainty_eez'
        managed = False

    class Admin(LoggedAdmin):
        verbose_name = 'Uncertainty EEZ'
        list_display = (
            'row_id',
            'eez_id',
            'eez_name',
            'sector_type',
            'sector',
            'period_id',
            'score_id',
        )
        show_full_result_count = True


class MarineLayer(models.Model):
    marine_layer_id = models.IntegerField(primary_key=True, blank=False, null=False)
    remarks = models.CharField(max_length=50, null=False, blank=True)
    name = models.CharField(max_length=50, null=False, blank=True)
    bread_crumb_name = models.CharField(max_length=50, null=False, blank=True)
    show_sub_areas = models.BooleanField(default=False, null=False)
    last_report_year = models.IntegerField(null=False, blank=False)

    def __str__(self):
        return self.name

    class Meta:
        db_table = 'marine_layer'
        ordering = ['marine_layer_id']
        managed = False

    class Admin(LoggedAdmin):
        verbose_name = 'Marine Layer'
        verbose_name_plural = 'Marine Layers'
        list_display = (
            'marine_layer_id',
            'name',
            'remarks'
        )


class UnderReviewArea(models.Model):
    row_id = models.IntegerField(primary_key=True, blank=False, db_column='area_invisible_id')
    marine_layer_id = models.ForeignKey(to=MarineLayer, db_column='marine_layer_id')
    main_area_id = models.IntegerField(null=False, blank=False)
    sub_area_id = models.IntegerField(null=False, blank=False, default=0)

    class Meta:
        db_table = 'area_invisible'
        ordering = ['row_id']
        managed = False

    class Admin(LoggedAdmin):
        verbose_name = 'Under Review Area'
        verbose_name_plural = 'Under Review Areas'
        list_display = (
            'row_id',
            'marine_layer_id',
            'main_area_id',
            'sub_area_id'
        )
        show_full_result_count = True


class CountryProfile(models.Model):
    profile_id = models.IntegerField(primary_key=True, blank=False)
    c_number = models.IntegerField(null=True, blank=True)
    count_code = models.IntegerField(null=False, blank=False)
    country_name = models.CharField(max_length=50)
    fish_mgt_plan = models.TextField(null=True, blank=True)
    url_fish_mgt_plan = models.TextField(null=True, blank=True)
    gov_marine_fish = models.TextField(null=True, blank=True)
    major_law_plan = models.TextField(null=True, blank=True)
    url_major_law_plan = models.TextField(null=True, blank=True)
    gov_protect_marine_env = models.TextField(null=True, blank=True)
    url_gov_protect_marine_env = models.TextField(null=True, blank=True)

    class Meta:
        db_table = 'country_fishery_profile'
        ordering = ['profile_id']
        managed = False

    class Admin(LoggedAdmin):
        verbose_name = 'Country Fishery Profile'
        verbose_name_plural = 'Country Fishery Profiles'
        list_display = (
            'profile_id',
            'country_name'
        )
    
