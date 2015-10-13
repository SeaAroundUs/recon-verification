from django.conf.urls import patterns, url
from django.contrib.auth.decorators import login_required

from distribution import views


urlpatterns = patterns(
    'distribution.views',
    url(r'^$', login_required(views.DistributionView.as_view()), name='index'),
    url(r'^taxon/(?P<taxon_id>\d+)$', views.TaxonDistributionView.as_view(), name='taxon-distribution'),
    url(r'^taxon/(?P<taxon_id>\d+)/extent$', views.TaxonExtentView.as_view(), name='taxon-extent')
)
