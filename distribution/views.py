import logging
import threading

from django.http import JsonResponse, HttpResponse
from django.shortcuts import render
from django.views.generic.base import View

logger = logging.getLogger(__name__)


FAILURE_MESSAGE = 'unable to import species_distribution, check your credentials in ~/.species_distribution/settings.json'

try:
    import species_distribution
    from species_distribution.models.taxa import Taxon, TaxonExtent
except Exception as e:
    logger.warning(FAILURE_MESSAGE + str(e))


class DistributionView(View):
    template = 'distribution.html'

    def get(self, request):
        try:
            with species_distribution.models.db.Session() as session:
                taxa = session.query(Taxon) \
                    .join(TaxonExtent, Taxon.taxon_key == TaxonExtent.taxon_key) \
                    .order_by(Taxon.taxon_key)
                return render(request, self.template, {'taxa': taxa})
        except Exception as e:
            return HttpResponse('{}  Error: {}'.format(FAILURE_MESSAGE, str(e)))

    def post(self, request):
        taxon_key = request.POST['taxon_key']
        thread = threading.Thread(
            target=species_distribution.create_and_save_taxon,
            args=(taxon_key,),
            kwargs={'force': True}
        )
        thread.start()
        return JsonResponse({'thread_id': thread.name})
