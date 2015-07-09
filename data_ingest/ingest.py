from collections import OrderedDict
from data_ingest.models import FileUpload, RawCatch
from catch.models import Taxon, CatchType, FishingEntity, EEZ, Sector
from decimal import Decimal
import xlrd
import re
import time
import logging


logger = logging.getLogger(__name__)


class ContributedFile:
    def __init__(self, contributed_file, user):
        self.user = user
        self.contributed_file = contributed_file

        new_name = re.sub(r'(\.[^\.]+)$', r'%s\1' % str(time.time()).split('.')[0], contributed_file.name)
        contributed_file.name = new_name
        fileupload = FileUpload(file=self.contributed_file.name, user=self.user)
        fileupload.save()  # TODO don't save row until file is 100% loaded (and also saved in S3?)

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

        # iterate over every row in the file
        for recon_datum in self.excel_file_dict['Catch Data']:
            kwargs = {key.lower().strip().replace(' ', '_'): val for (key, val) in recon_datum.items()}

            # add special fields
            kwargs.update({'user': user, 'source_file': source_file})

            # ensure decimal fields are properly typed
            for decimal_field in ('amount', 'adjustment_factor'):
                val = kwargs[decimal_field]
                if isinstance(val, str):
                    val = val.strip()
                kwargs[decimal_field] = Decimal(val) if val else None

            # throw the row in the pile
            raw_catches.append(RawCatch(**kwargs))

        # create all the rows
        RawCatch.objects.bulk_create(raw_catches)

    def process(self):
        self._process_excel_file()
        if 'Catch Data' in self.excel_file_dict:  # TODO need better check here
            self._insert_reconstruction_data()
            normalize(self.fileupload_id)
        else:
            pass  # TODO raise some kind of error here


def normalize(file_id):
    for row in RawCatch.objects.filter(source_file_id=file_id):
        try:
            taxon = Taxon.objects.filter(scientific_name__iexact=row.taxon_name.strip())[0]
            row.taxon_key = taxon.taxon_key
        except IndexError:  # no Taxon found
            row.taxon_key = 0

        try:
            catch_type = CatchType.objects.get(name__iexact=row.catch_type.strip())
            row.catch_type_id = catch_type.catch_type_id
        except CatchType.DoesNotExist:  # no CatchType found
            row.catch_type_id = 0

        try:
            fishing_entity = FishingEntity.objects.get(name__iexact=row.fishing_entity.strip())
            row.fishing_entity_id = fishing_entity.fishing_entity_id
        except FishingEntity.DoesNotExist:  # no Country found
            row.fishing_entity_id = 0

        try:
            eez = EEZ.objects.get(name__iexact=row.eez.strip())
            row.eez_id = eez.eez_id
        except EEZ.DoesNotExist:  # no EEZ found
            row.eez_id = 0

        try:
            sector = Sector.objects.get(name__iexact=row.sector.strip())
            row.sector_id = sector.sector_type_id
        except Sector.DoesNotExist:  # no Sector found
            row.sector_id = 0

        if row.eez_id != 0 and row.fishing_entity_id != 0:
            try:
                eez_owner = EEZ.objects.get(eez_id=row.eez_id).fishing_entity
                row.layer = 1 if eez_owner.fishing_entity_id == row.fishing_entity_id else 2
                # TODO layer 3 logic based on taxon
            except Exception:  # TODO more specific exception?
                row.layer = 0
        else:
            row.layer = 0

        # TODO more normalization

        row.save()
