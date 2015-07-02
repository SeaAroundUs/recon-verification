from django.contrib import admin
from catch.models import Country, EEZ, FAO, ICES, NAFO, \
    Sector, CatchType, Taxon

admin.site.register(Country)
admin.site.register(EEZ)
admin.site.register(FAO)
admin.site.register(ICES)
admin.site.register(NAFO)
admin.site.register(Sector)
admin.site.register(CatchType)
admin.site.register(Taxon)
