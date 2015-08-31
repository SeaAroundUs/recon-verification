from django.contrib import admin
from catch.models import FishingEntity, EEZ, FAO, ICESArea, NAFO, \
    AccessAgreement, AccessType

admin.site.register(FishingEntity, FishingEntity.Admin)
admin.site.register(EEZ, EEZ.Admin)
admin.site.register(FAO, FAO.Admin)
admin.site.register(ICESArea, ICESArea.Admin)
admin.site.register(NAFO, NAFO.Admin)
admin.site.register(AccessAgreement, AccessAgreement.Admin)
admin.site.register(AccessType, AccessType.Admin)
