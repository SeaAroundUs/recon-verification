from django.conf.urls import patterns, url
from django.contrib.auth.decorators import login_required
from data_ingest.views import EditNormalizeView, DataBrowseView, FileUploadCreateView, \
    UploadDataJsonView, CatchFieldsJsonView, DataNormalizationView, CommitView, \
    UploadRefView, DeleteRowView, HealthView, CustomView


urlpatterns = patterns(
    'data_ingest.views',
    url(r'^edit-normalize/$',
        login_required(EditNormalizeView.as_view()),
        name='edit-normalize'
        ),
    url(r'^browse-upload/$', login_required(DataBrowseView.as_view()), name='browse-upload'),
    url(r'^upload/$', login_required(FileUploadCreateView.as_view()), name='upload-json'),
    url(r'^upload-ref/$', login_required(UploadRefView.as_view()), name='upload-ref'),
    url(r'^delete-row/$', login_required(DeleteRowView.as_view()), name='delete-row'),
    url(r'^data/(?P<page>\d+)$',
        login_required(UploadDataJsonView.as_view()),
        name='uploaded-data-json'),
    url(r'^save-data/$',
        login_required(UploadDataJsonView.as_view()),
        name='save-data'),
    url(r'^fields/$', login_required(CatchFieldsJsonView.as_view()), name='catch-fields-json'),
    url(r'^normalize/$', login_required(DataNormalizationView.as_view()), name='normalize-data'),
    url(r'^commit/$', login_required(CommitView.as_view()), name='commit-data'),
    url(r'^health/$', login_required(HealthView.as_view()), name='health'),
    url(r'^custom/$', CustomView.as_view(), name='custom')
)
