from django.contrib import admin
from catch.models import FishingEntity, FAO, ICESArea, NAFO, \
    AccessAgreement, AccessType, GeoEntity, Taxon, CommercialGroup, \
    FunctionalGroup, TaxonLevel, TaxonGroup, Reference, RareTaxon, \
    Layer3Taxon, HabitatIndex, LME, RFMO

admin.site.disable_action('delete_selected')

admin.site.register(FishingEntity, FishingEntity.Admin)
# admin.site.register(EEZ, EEZ.Admin) # LP-25476528
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
