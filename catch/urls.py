from django.conf.urls import patterns, url
from catch.views import HomeView


urlpatterns = patterns(
    'catch.views',
    url(r'^$', HomeView.as_view(), name='recon-home'),
    )
