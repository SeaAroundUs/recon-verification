import csv
import io
import logging
import struct
import threading

from django.http import HttpResponse, JsonResponse
from django.shortcuts import render
from django.views.generic.base import View
import topojson

logger = logging.getLogger(__name__)


try:
    from species_distribution.models import db
    from species_distribution.models.taxa import Taxon
    from species_distribution.models.taxa import TaxonDistributionLog
    from species_distribution.models.taxa import TaxonExtent
    from species_distribution.distribution import create_and_save_taxon

    from sqlalchemy.orm import joinedload

except Exception as e:
    logger.exception('unable to import species_distribution, check your credentials in ~/.species_distribution/settings.json.')


class DistributionView(View):
    template = 'distribution.html'

    def get(self, request):
        try:
            with db.Session() as session:
                taxa = session.query(Taxon) \
                    .options(joinedload(Taxon.distribution_log)) \
                    .join(TaxonExtent, Taxon.taxon_key == TaxonExtent.taxon_key)  \
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
        logger.warn('recalculating distribution for {} (thread id: {})'.format(taxon_key, thread.name))
        return JsonResponse({'thread_id': thread.name})


class TaxonExtentView(View):

    def get(self, request, taxon_id=None):

        with db.Session() as session:
            raw_conn = session.connection().connection
            cursor = raw_conn.cursor()

            query = """SELECT ST_AsGeoJSON(ST_Simplify(geom, .04), 6)::json as geojson
                FROM distribution.taxon_extent
                WHERE taxon_key=%(taxon_key)s
            """

            cursor.execute(query, {'taxon_key': taxon_id})
            # topojson.py doesn't currently support a raw MultiPolygon, so wrap it in
            # a FeatureCollection
            features = []
            for geom in cursor:
                features.append(
                    {
                    'type': 'Feature',
                    'properties': {'taxon_key': taxon_id},
                    'geometry': geom[0]
                })
            geojson = {'type':'FeatureCollection', 'features': features}
            # topojson conversion is shaky
            # tj = topojson.conversion.convert(geojson)
            return JsonResponse(geojson)


class TaxonDistributionView(View):

    def get(self, request, taxon_id=None):


        with db.Session() as session:
            raw_conn = session.connection().connection
            cursor = raw_conn.cursor()

            if request.GET.get('format','').lower() == 'csv':
                query = """select cell_id, relative_abundance as relative_abundance
                    from distribution.taxon_distribution d
                    where taxon_key=%(id)s order by cell_id"""
                cursor.execute(query, {'id': taxon_id})
                rows = ((x[0], '{:.15f}'.format(x[1])) for x in cursor)
                f = io.StringIO()
                writer = csv.writer(f)
                writer.writerow(('cell_id', 'relative_abundance'))
                writer.writerows(rows)
                f.seek(0)
                return HttpResponse(f, content_type='text/csv')
            else:
                query = """select cell_id, round(((relative_abundance-s.min)/s.max)*255)::int as relative_abundance
                    from distribution.taxon_distribution d,
                    (SELECT max(relative_abundance) as max, min(relative_abundance) as min from distribution.taxon_distribution where taxon_key=%(id)s) s
                    where taxon_key=%(id)s order by cell_id"""
                cursor.execute(query, {'id': taxon_id})
                # return packed binary
                data = ((cell_id | (x << 24)) for cell_id, x in cursor)
                packed = struct.pack('I' * cursor.rowcount, *data)
                return HttpResponse(packed, content_type='application/octet-stream')
