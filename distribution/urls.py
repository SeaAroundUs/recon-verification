from django.conf.urls import patterns, url
from django.contrib.auth.decorators import login_required

from distribution import views


urlpatterns = patterns(
    'distribution.views',
    url(r'^$', login_required(views.DistributionView.as_view()), name='distribution'))
