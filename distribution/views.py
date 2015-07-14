import threading

from django.http import JsonResponse
from django.shortcuts import render
from django.views.generic.base import View
import species_distribution
from species_distribution.models.taxa import Taxon, TaxonExtent


class DistributionView(View):
    template = 'distribution.html'

    def get(self, request):
        with species_distribution.models.db.Session() as session:
            taxa = session.query(Taxon) \
                .join(TaxonExtent, Taxon.taxon_key == TaxonExtent.taxon_key) \
                .order_by(Taxon.taxon_key)
            return render(request, self.template, {'taxa': taxa})

    def post(self, request):
        taxon_key = request.POST['taxon_key']
        thread = threading.Thread(
            target=species_distribution.create_and_save_taxon,
            args=(taxon_key,),
            kwargs={'force': True}
        )
        thread.start()
        return JsonResponse({'thread_id': thread.name})
