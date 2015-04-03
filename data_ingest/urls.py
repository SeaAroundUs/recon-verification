from django.conf.urls import patterns, url
from data_ingest.views import FileUploadCreateView, DataBrowseView, UploadDataJsonView, \
    CatchFieldsJsonView, FileIngest, DataNormalizationView


urlpatterns = patterns(
    'data_ingest.views',
    url(r'^recon_data/upload.html$', FileUploadCreateView.as_view(), name='recon-file-upload'),
    url(r'^recon_data/browse.html$', DataBrowseView.as_view(), name='recon-data-browse'),
    url(r'^uploaded_data/json/$', UploadDataJsonView.as_view(), name='uploaded-data-json'),
    url(r'^catch_fields/json/$', CatchFieldsJsonView.as_view(), name='catch-fields-json'),
    url(r'^normalize/$', DataNormalizationView.as_view(), name='normalize-data'),
    url(r'^ingest/$', FileIngest.as_view(), name='file-ingest'),
    )
