from django.contrib import admin
from catch.models import FishingEntity, EEZ, FAO, ICESArea, NAFO, \
    AccessAgreement, AccessType, GeoEntity, Taxon, CommercialGroup, \
    FunctionalGroup, TaxonLevel, TaxonGroup, Reference, RareTaxon, \
    Layer3Taxon, HabitatIndex, LME, RFMO, RFMOManagedTaxon, HighSeas, \
    TaxonSubstitution, AdHocQuery, Cell, ExcludedTaxon, ISSCAAP, Gear, \
    ProcedureAndOutcome, UncertaintyEEZ, UncertaintyScore, UncertaintyTimePeriod, \
    UnderReviewArea, CountryProfile, MarineLayer, EndUse

# this line is disables bulk deletion on the admin list pages
admin.site.disable_action('delete_selected')

# to add a model to the admin editing section add it to the import statement
# above, then add a line to the block below
admin.site.register(FishingEntity, FishingEntity.Admin)
admin.site.register(EEZ, EEZ.Admin)
admin.site.register(GeoEntity, GeoEntity.Admin)
admin.site.register(FAO, FAO.Admin)
admin.site.register(ICESArea, ICESArea.Admin)
admin.site.register(NAFO, NAFO.Admin)
admin.site.register(AccessAgreement, AccessAgreement.Admin)
admin.site.register(AccessType, AccessType.Admin)
admin.site.register(Taxon, Taxon.Admin)
admin.site.register(TaxonLevel, TaxonLevel.Admin)
admin.site.register(TaxonGroup, TaxonGroup.Admin)
admin.site.register(RareTaxon, RareTaxon.Admin)
admin.site.register(Layer3Taxon, Layer3Taxon.Admin)
admin.site.register(CommercialGroup, CommercialGroup.Admin)
admin.site.register(FunctionalGroup, FunctionalGroup.Admin)
admin.site.register(Reference, Reference.Admin)
admin.site.register(HabitatIndex, HabitatIndex.Admin)
admin.site.register(LME, LME.Admin)
admin.site.register(RFMO, RFMO.Admin)
admin.site.register(RFMOManagedTaxon, RFMOManagedTaxon.Admin)
admin.site.register(HighSeas, HighSeas.Admin)
admin.site.register(TaxonSubstitution, TaxonSubstitution.Admin)
admin.site.register(AdHocQuery, AdHocQuery.Admin)
admin.site.register(Cell, Cell.Admin)
admin.site.register(ExcludedTaxon, ExcludedTaxon.Admin)
admin.site.register(ISSCAAP, ISSCAAP.Admin)
admin.site.register(Gear, Gear.Admin)
admin.site.register(EndUse, EndUse.Admin)
admin.site.register(ProcedureAndOutcome, ProcedureAndOutcome.Admin)
admin.site.register(UncertaintyEEZ, UncertaintyEEZ.Admin)
admin.site.register(UncertaintyScore, UncertaintyScore.Admin)
admin.site.register(UncertaintyTimePeriod, UncertaintyTimePeriod.Admin)
admin.site.register(UnderReviewArea, UnderReviewArea.Admin)
admin.site.register(CountryProfile, CountryProfile.Admin)
admin.site.register(MarineLayer, MarineLayer.Admin)
