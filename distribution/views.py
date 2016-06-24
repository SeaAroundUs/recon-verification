import csv
import io
import logging
import struct
import threading

from django.http import HttpResponse, JsonResponse, Http404
from django.shortcuts import render
from django.views.generic.base import View
import topojson

from .aquamaps import get_map

logger = logging.getLogger(__name__)


try:
    from species_distribution.models import db
    from species_distribution.models.taxa import Taxon
    from species_distribution.models.taxa import TaxonDistributionLog
    from species_distribution.models.taxa import TaxonExtent
    from species_distribution.distribution import create_and_save_distribution

    from sqlalchemy.orm import joinedload

except Exception as e:
    logger.exception('unable to import species_distribution, check your credentials in ~/.species_distribution/settings.json.')


class DistributionView(View):
    template = 'distribution.html'

    def get(self, request):
        try:
            with db.Session() as session:
                query = """SELECT t.*, l.modified_timestamp,
                                  (e.taxon_key IS NOT NULL) AS is_extent_available,
                                  (h.taxon_key IS NOT NULL) AS is_habitat_available,
                                  EXISTS (SELECT 1 FROM allocation.taxon_distribution_old o WHERE o.taxon_key = t.taxon_key LIMIT 1) AS is_old_distribution_available
                    FROM master.taxon t
                    LEFT JOIN distribution.taxon_distribution_log l ON (l.taxon_key = t.taxon_key)
                    LEFT JOIN distribution.taxon_extent e ON (e.taxon_key = t.taxon_key)
                    LEFT JOIN distribution.taxon_habitat h ON (h.taxon_key = t.taxon_key)
                    WHERE NOT t.is_retired
                      AND (e.taxon_key IS NOT NULL OR h.taxon_key IS NOT NULL)
                    ORDER BY l.modified_timestamp DESC NULLS LAST
                """

                taxa = session.execute(query).fetchall()
                return render(request, self.template, {'taxa': taxa})
        except:
            msg = 'unable to query species_distribution'
            logger.exception(msg)
            raise

    def post(self, request):
        taxon_key = request.POST['taxon_key']
        thread = threading.Thread(
            target=create_and_save_distribution,
            args=(taxon_key,),
            kwargs={'force': True}
        )
        thread.start()
        logger.warn('recalculating distribution for {} (thread id: {})'.format(taxon_key, thread.name))
        return JsonResponse({'thread_id': thread.name})

class AquamapsView(View):

    def get(self, request, taxon_key):
        with db.Session() as session:
            taxa = session.query(Taxon) \
                .filter(Taxon.taxon_key == taxon_key) \
                .first()
            if not taxa:
                raise Http404

            genus, species = taxa.scientific_name.split()
            body = get_map(genus, species)
            return HttpResponse(body)

class TaxonExtentView(View):

    def get(self, request, taxon_key=None):

        with db.Session() as session:
            raw_conn = session.connection().connection
            cursor = raw_conn.cursor()

            query = """SELECT ST_AsGeoJSON(ST_SimplifyPreserveTopology(geom, .1), 4)::json as geojson
                FROM distribution.taxon_extent
                WHERE taxon_key=%(taxon_key)s
            """

            cursor.execute(query, {'taxon_key': taxon_key})
            # topojson.py doesn't currently support a raw MultiPolygon, so wrap it in
            # a FeatureCollection
            features = []
            for geom in cursor:
                features.append(
                    {
                    'type': 'Feature',
                    'properties': {'taxon_key': taxon_key},
                    'geometry': geom[0]
                })
            geojson = {'type':'FeatureCollection', 'features': features}
            # topojson conversion is shaky
            # tj = topojson.conversion.convert(geojson)
            return JsonResponse(geojson)


class TaxonDistributionView(View):

    def get(self, request, taxon_key=None, source=None):

        with db.Session() as session:
            raw_conn = session.connection().connection
            cursor = raw_conn.cursor()

            if (source == 'new'):
                distribution_table_name = 'distribution.taxon_distribution'
            elif (source == 'old'):
                distribution_table_name = 'allocation.taxon_distribution_old'

            if request.GET.get('format','').lower() == 'csv':
                query = "select cell_id, relative_abundance as relative_abundance " + \
                        "from " + distribution_table_name + " d " + \
                        "where taxon_key=%(id)s order by cell_id"
                cursor.execute(query, {'id': taxon_key})
                rows = ((x[0], '{:.15f}'.format(x[1])) for x in cursor)
                f = io.StringIO()
                writer = csv.writer(f)
                writer.writerow(('cell_id', 'relative_abundance'))
                writer.writerows(rows)
                f.seek(0)
                return HttpResponse(f, content_type='text/csv')
            else:
                query = "select cell_id, (width_bucket(relative_abundance, s.min, s.max, 255)-1) as relative_abundance " + \
                        "from " + distribution_table_name + " d," + \
                        "(SELECT max(relative_abundance) as max, min(relative_abundance) as min from " + distribution_table_name + " where taxon_key=%(id)s) s " + \
                        "where taxon_key=%(id)s order by cell_id"
                cursor.execute(query, {'id': taxon_key})
                # return packed binary
                data = ((cell_id | (x << 24)) for cell_id, x in cursor)
                packed = struct.pack('I' * cursor.rowcount, *data)
                return HttpResponse(packed, content_type='application/octet-stream')