from django.conf.urls import patterns, url
from django.contrib.auth.decorators import login_required

from distribution import views


urlpatterns = patterns(
    'distribution.views',
    url(r'^$', login_required(views.DistributionView.as_view()), name='index'),
    url(r'^taxon/(?P<taxon_id>\d+)$', login_required(views.TaxonDistributionView.as_view()), name='taxon-distribution')
)
