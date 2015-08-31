from django.db import models
from django.contrib import admin
from data_ingest.models import RawCatch


class GeoEntity(models.Model):
    geo_entity_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50)
    admin_geo_entity_id = models.IntegerField()
    jurisdiction_id = models.IntegerField(null=True, blank=True)
    started_eez_at = models.CharField(max_length=50, null=True, blank=True)
    legacy_c_number = models.IntegerField()
    legacy_admin_c_number = models.IntegerField()

    class Meta:
        verbose_name = 'Geo entity'
        verbose_name_plural = 'Geo entities'
        db_table = 'geo_entity'
        ordering = ['geo_entity_id']
        managed = False

    class Admin(admin.ModelAdmin):
        list_display = (
            'geo_entity_id',
            'name'
        )
        search_fields = ['name']
        show_full_result_count = True

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

    class Admin(admin.ModelAdmin):
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

    class Admin(admin.ModelAdmin):
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

    class Admin(admin.ModelAdmin):
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

    class Admin(admin.ModelAdmin):
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

    class Admin(admin.ModelAdmin):
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

    class Admin(admin.ModelAdmin):
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

    class Admin(admin.ModelAdmin):
        list_display = (
            'catch_type_id',
            'name'
        )
        show_full_result_count = True

    def __str__(self):
        return self.name


class Taxon(models.Model):
    taxon_key = models.IntegerField(primary_key=True)
    common_name = models.CharField(max_length=255)
    scientific_name = models.CharField(max_length=255)
    # TODO much more to do here

    class Meta:
        verbose_name_plural = 'Taxa'
        ordering = ['common_name', 'scientific_name']
        db_table = 'taxon'
        managed = False

    class Admin(admin.ModelAdmin):
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

    def __str__(self):
        return self.name


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


class AccessType(models.Model):
    id = models.AutoField(primary_key=True)
    description = models.TextField()

    class Meta:
        verbose_name = 'Access type'
        verbose_name_plural = 'Access types'
        ordering = ['id']
        db_table = 'access_type'
        managed = False

    class Admin(admin.ModelAdmin):
        list_display = (
            'id',
            'description'
        )
        search_fields = ['description']
        show_full_result_count = True

    def __str__(self):
        return self.description


class AccessAgreement(models.Model):
    id = models.AutoField(primary_key=True)
    fishing_entity_id = models.IntegerField()
    fishing_entity = models.CharField(max_length=255)
    eez_id = models.IntegerField()
    eez_name = models.CharField(max_length=255)
    title_of_agreement = models.CharField(max_length=255)
    access_category = models.CharField(max_length=255)
    access_type = models.ForeignKey(to=AccessType)
    agreement_type_id = models.IntegerField()
    start_year = models.IntegerField()
    end_year = models.IntegerField()
    duration_type = models.CharField(max_length=255, null=True, blank=True)
    duration_details = models.CharField(max_length=255, null=True, blank=True)
    functional_group_id = models.CharField(max_length=255, null=True, blank=True)
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

    class Admin(admin.ModelAdmin):
        list_display = (
            'id',
            'fishing_entity',
            'eez_name',
            'title_of_agreement',
            'access_type',
            'start_year',
            'end_year'
        )
        list_filter = ('access_type',)
        search_fields = ['fishing_entity', 'eez_name', 'title_of_agreement']
        show_full_result_count = True

    def __str__(self):
        return self.title_of_agreement
