from django.contrib import admin
from catch.models import FishingEntity, EEZ, FAO, ICESArea, NAFO

admin.site.register(FishingEntity)
admin.site.register(EEZ)
admin.site.register(FAO)
admin.site.register(ICESArea)
admin.site.register(NAFO)
