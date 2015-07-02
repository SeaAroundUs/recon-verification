import xlrd
from django.core.files.uploadedfile import UploadedFile
from collections import OrderedDict
from data_ingest.models import FileUpload, RawCatch
from catch.models import Taxon, CatchType, Country, EEZ, Sector
from django.db import connection
import re
import time
import logging
from decimal import *


logger = logging.getLogger(__name__)


class ContributedFile:
    def __init__(self, contributed_file, user, fileupload_id=None):
        self.user = user

        # file can be a File or a file_path:
        if isinstance(contributed_file, str):
            self.contributed_file = open(contributed_file, 'rb')
        elif isinstance(contributed_file, UploadedFile):
            self.contributed_file = contributed_file

        if fileupload_id:
            self.fileupload_id = fileupload_id
        else:
            new_name = re.sub(r'(\.[^\.]+)$', r'%s\1' % str(time.time()).split('.')[0], contributed_file.name)
            contributed_file.name = new_name
            fileupload = FileUpload(file=self.contributed_file.name, user=self.user)
            fileupload.save()
            self.fileupload_id = FileUpload.objects.latest('id').id

        self.excel_file_dict = {}

    def _convert_to_dict(self, sheet):
        fields = sheet.row_values(0)
        return (OrderedDict(zip(fields, sheet.row_values(rx))) for rx in range(1, sheet.nrows))

    def _process_excel_file(self):
        book = xlrd.open_workbook(
            file_contents=self.contributed_file.read(),
            encoding_override='utf-8'
        )
        for sheet in book.sheets():
            self.excel_file_dict[sheet.name] = self._convert_to_dict(sheet)

    def _insert_reconstruction_data(self):
        raw_catches = []
        source_file = FileUpload.objects.get(id=self.fileupload_id)
        user = self.user
        for recon_datum in self.excel_file_dict['Catch Data']:
            kwargs = {key.lower().strip().replace(' ', '_'): val for (key, val) in recon_datum.items()}

            # add special fields
            kwargs.update({'user': user, 'source_file': source_file})

            # ensure decimal fields are properly typed
            for decimal_field in ('amount', 'adjustment_factor'):
                kwargs[decimal_field] = Decimal(kwargs[decimal_field]) if kwargs[decimal_field] else 0.0

            raw_catches.append(RawCatch(**kwargs))
        RawCatch.objects.bulk_create(raw_catches)

    def _truncate_rawcatch_table(self):  # TODO do we still need this?
        connection.cursor().execute('''
        TRUNCATE TABLE "{0}" CASCADE;
        ALTER SEQUENCE {0}_id_seq RESTART WITH 1;
        '''.format(RawCatch._meta.db_table))

    def process(self):
        self._process_excel_file()
        if 'Catch Data' in self.excel_file_dict:  # TODO better check here
            self._insert_reconstruction_data()
            normalize(self.fileupload_id)
        else:
            pass  # TODO raise some kind of error here


def normalize(file_id):
    for row in RawCatch.objects.filter(source_file_id=file_id):
        try:
            taxon = Taxon.objects.filter(name__iexact=row.taxon_name.strip())[0]
            row.taxon_key = taxon.taxon_key
        except IndexError:  # no Taxon found
            row.taxon_key = 0

        try:
            catch_type = CatchType.objects.get(type__iexact=row.catch_type.strip())
            row.catch_type_id = catch_type.id
        except CatchType.DoesNotExist:  # no CatchType found
            row.catch_type_id = 0

        try:
            country = Country.objects.get(name__iexact=row.fishing_entity.strip())
            row.fishing_entity_id = country.id
        except Country.DoesNotExist:  # no Country found
            row.fishing_entity_id = 0

        try:
            eez = EEZ.objects.get(name__iexact=row.eez.strip())
            row.eez_id = eez.id
        except EEZ.DoesNotExist:  # no EEZ found
            row.eez_id = 0

        try:
            sector = Sector.objects.get(name__iexact=row.sector.strip())
            row.sector_id = sector.id
        except Sector.DoesNotExist:  # no Sector found
            row.sector_id = 0

        if row.eez_id != 0 and row.fishing_entity_id != 0:
            try:
                eez_country = EEZ.objects.get(id=row.eez_id).country
                row.layer = 1 if eez_country.id == row.fishing_entity_id else 2
                # TODO layer 3 logic based on taxon
            except Exception:  # TODO more specific exception?
                row.layer = 0
        else:
            row.layer = 0

        # TODO more normalization

        row.save()


def ingest_file(file_path, user):
    file_to_ingest = ContributedFile(file_path, user)
    return file_to_ingest.process()
