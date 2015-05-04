from django.conf.urls import patterns, url
from data_ingest.views import FileUploadCreateView, DataBrowseView, UploadDataJsonView, \
    CatchFieldsJsonView, FileIngest, DataNormalizationView, EditNormalizeView


urlpatterns = patterns(
    'data_ingest.views',
    url(r'^edit-normalize/(?P<file_id>\d+)$', EditNormalizeView.as_view(), name='edit-normalize'),
    url(r'^browse-upload/$', DataBrowseView.as_view(), name='browse-upload'),
    url(r'^upload/$', FileUploadCreateView.as_view(), name='upload-json'),
    url(r'^data/(?P<file_id>\d+)$', UploadDataJsonView.as_view(), name='uploaded-data-json'),
    url(r'^fields/$', CatchFieldsJsonView.as_view(), name='catch-fields-json'),
    url(r'^normalize/(?P<file_id>\d+)$', DataNormalizationView.as_view(), name='normalize-data'),
    url(r'^ingest/$', FileIngest.as_view(), name='file-ingest'),
    )
