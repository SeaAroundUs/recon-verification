import logging
import struct
import threading

from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
from django.views.generic.base import View

logger = logging.getLogger(__name__)


try:
    from species_distribution.models.db import engine, Session
    from species_distribution.models.taxa import Taxon
    from species_distribution.models.taxa import TaxonExtent
    from species_distribution.distribution import create_and_save_taxon

except Exception as e:
    logger.exception('unable to import species_distribution, check your credentials in ~/.species_distribution/settings.json.')


class DistributionView(View):
    template = 'distribution.html'

    def get(self, request):
        try:
            with Session() as session:
                taxa = session.query(Taxon) \
                    .join(TaxonExtent, Taxon.taxon_key == TaxonExtent.taxon_key) \
                    .order_by(Taxon.taxon_key)
                return render(request, self.template, {'taxa': taxa})
        except:
            msg = 'unable to query species_distribution'
            logger.exception(msg)
            raise

    def post(self, request):
        taxon_key = request.POST['taxon_key']
        thread = threading.Thread(
            target=create_and_save_taxon,
            args=(taxon_key,),
            kwargs={'force': True}
        )
        thread.start()
        return JsonResponse({'thread_id': thread.name})


class TaxonDistributionView(View):

    def get(self, request, taxon_id=None):

        with engine.connect() as connection:

            # love this
            raw_conn = connection.connection.connection
            cursor = raw_conn.cursor()

            query = """select cell_id, round(((relative_abundance-s.min)/s.max)*255)::int as relative_abundance
                from distribution.taxon_distribution d,
                (SELECT max(relative_abundance) as max, min(relative_abundance) as min from distribution.taxon_distribution where taxon_key=%(id)s) s
                where taxon_key=%(id)s order by cell_id"""
            cursor.execute(query, {'id': taxon_id})
            data = ((cell_id | (x << 24)) for cell_id, x in cursor)
            packed = struct.pack('I' * cursor.rowcount, *data)
            return HttpResponse(packed, content_type='application/octet-stream')
