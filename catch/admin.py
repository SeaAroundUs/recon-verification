from django.contrib import admin

from catch.models import Taxon, CatchType, Country, EEZ, Sector

admin.site.register(Taxon)
admin.site.register(CatchType)
admin.site.register(Country)
admin.site.register(EEZ)
admin.site.register(Sector)

