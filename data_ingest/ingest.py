import xlrd
from django.core.files.uploadedfile import UploadedFile
from django.utils.datastructures import SortedDict
from django.contrib.auth.models import User
import data_ingest.sheet_template
from data_ingest.models import FileUpload, RawCatch
from catch.models import Taxon, CatchType, Country, EEZ
from django.db import connection


class ContributedFile():
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
            fileupload = FileUpload(
                file=self.contributed_file.name,
                user=self.user,
            )
            fileupload.save()
            self.fileupload_id = FileUpload.objects.latest('id').id
        self.excel_file_dict = {}

    def _convert_to_dict(self, sheet):
        converted_data = []
        if sheet.name in data_ingest.sheet_template.templates:
            fields = data_ingest.sheet_template.templates[sheet.name]['fields']
            for rx in range(data_ingest.sheet_template.templates[sheet.name]['first_row'], sheet.nrows):
                row = sheet.row(rx)
                if not row:
                    continue
                values = map(lambda cell: cell.value, row)
                item_data = SortedDict(zip(fields, values))
                converted_data.append(item_data)
        return converted_data

    def _process_excel_file(self):
        book = xlrd.open_workbook(
            file_contents=self.contributed_file.read(), encoding_override='utf-8'
        )
        for sheet in book.sheets():
            self.excel_file_dict[sheet.name] = self._convert_to_dict(sheet)

    def _insert_reconstruction_data(self):
        raw_catches = []
        for recon_datum in self.excel_file_dict['Catch Data']:
            if recon_datum['fishing entity']:

                recon_data = RawCatch(
                    fishing_entity=recon_datum['fishing entity'],
                    fishing_entity_id=0,
                    original_country_fishing=recon_datum['original country fishing'],
                    eez_area=recon_datum['EEZ'],
                    eez_id=0,
                    eez_sub_area=recon_datum['EEZ sub area'],
                    fao_area=int(recon_datum['FAO area']) if recon_datum['FAO area'] and recon_datum['FAO area'] != '' else 0,
                    sub_regional_area=recon_datum['subregional area'],
                    province_state=recon_datum['province state'],
                    ices_division=recon_datum['ICES division'],
                    ices_subdivision=recon_datum['ICES subdivision'],
                    nafo_division=recon_datum['NAFO division'],
                    ccamlr_area=recon_datum['CCAMLR area'],
                    layer=int(recon_datum['layer']) if recon_datum['layer'] and recon_datum['layer'] != '' else 0,
                    year=recon_datum['year'],
                    taxon_name=recon_datum['taxon name'],
                    original_fao_name=recon_datum['original FAO name'],
                    taxon_key=0,
                    amount=recon_datum['amount'],
                    sector=recon_datum['sector'],
                    original_sector=recon_datum['original sector'],
                    catch_type=recon_datum['catch type'],
                    catch_type_id=0,
                    input_type=recon_datum['input type'],
                    reference_id=recon_datum['reference id'],
                    forward_carry_rule=recon_datum['forward carry rule'],
                    adjustment_factor=recon_datum['adjustment factor'],
                    gear_type=recon_datum['gear type'],
                    notes=recon_datum['notes'],

                    source_file=FileUpload.objects.get(id=self.fileupload_id),
                    user=self.user,
                )
                # recon_data.save()
                raw_catches.append(recon_data)
        RawCatch.objects.bulk_create(raw_catches)

    def _truncate_rawcatch_table(self):
        connection.cursor().execute('''
        TRUNCATE TABLE "{0}" CASCADE;
        ALTER SEQUENCE {0}_id_seq RESTART WITH 1;
        '''.format(RawCatch._meta.db_table))

    def process(self):
        self._process_excel_file()
        if 'Catch Data' in self.excel_file_dict:
            # purge data
            self._truncate_rawcatch_table()
            # insert new
            self._insert_reconstruction_data()
            # normalize data
            normalize()


def normalize():
    for row in RawCatch.objects.all():
        try:
            taxon = Taxon.objects.get(name__iexact=row.taxon_name.strip())
            row.taxon_key = taxon.taxon_key
        except Taxon.DoesNotExist:  # no Taxon found
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
            eez = EEZ.objects.get(name__iexact=row.eez_area.strip())
            row.eez_id = eez.id
        except EEZ.DoesNotExist:  # no EEZ found
            row.eez_id = 0

        row.save()

        # TODO more normalization


def ingest_file(file_path, username):
    user = User.objects.get(username=username)
    file_to_ingest = ContributedFile(file_path,
                                     user,)
    ingest_result = file_to_ingest.process()
