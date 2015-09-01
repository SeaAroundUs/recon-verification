from django.contrib import admin
from catch.models import FishingEntity, EEZ, FAO, ICESArea, NAFO, \
    AccessAgreement, AccessType, GeoEntity, Taxon, CommercialGroup, \
    FunctionalGroup, TaxonLevel, TaxonGroup

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
admin.site.register(CommercialGroup, CommercialGroup.Admin)
admin.site.register(FunctionalGroup, FunctionalGroup.Admin)
