from django.conf.urls import patterns, url
from django.contrib.auth.decorators import login_required

from distribution import views


urlpatterns = patterns(
    'distribution.views',
    url(r'^$', login_required(views.DistributionView.as_view()), name='index'),
    url(r'^taxon/(?P<taxon_key>\d+)/(?P<source>(new|old))$', views.TaxonDistributionView.as_view(), name='taxon-distribution'),
    url(r'^taxon/(?P<taxon_key>\d+)/extent$', views.TaxonExtentView.as_view(), name='taxon-extent'),
    url(r'^taxon/(?P<taxon_key>\d+)/aquamaps$', views.AquamapsView.as_view(), name='taxon-aquamaps')
)
