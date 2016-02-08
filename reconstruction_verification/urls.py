from django.conf.urls import patterns, include, url
from django.contrib import admin

urlpatterns = patterns(
    '',
    url(r'^admin/', include(admin.site.urls)),
    url(r'^data_ingest/', include('data_ingest.urls')),
    url(r'^distribution/', include('distribution.urls', namespace='distribution')),
    url(r'', include('catch.urls')),
)

admin.site.site_title = 'Reconstruction Data'
admin.site.site_header = 'Reconstruction Data'
admin.site.index_title = ''
