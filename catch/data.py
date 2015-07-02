from catch.models import CatchType, Sector
from django.db.transaction import atomic


def load_standing_data(apps, schema_editor):
    CatchLoader().load_data()
    SectorLoader().load_data()
    # TODO use json flat files for taxon, eez, etc


class CatchMixin(object):
    model = CatchType
    values = [
        {'id': 1, 'type': 'reported landings'},
        {'id': 2, 'type': 'discards'},
        {'id': 3, 'type': 'unreported landings'}
    ]


class SectorMixin(object):
    model = Sector
    values = [
        {'id': 1, 'name': 'Industrial'},
        {'id': 2, 'name': 'Subsistence'},
        {'id': 3, 'name': 'Artisanal'},
        {'id': 4, 'name': 'Recreational'}
    ]


class DataLoader(object):

    @atomic
    def load_data(self):
        for vals in self.values:
            row = self.model(**vals)
            row.save()


class CatchLoader(DataLoader, CatchMixin): pass
class SectorLoader(DataLoader, SectorMixin): pass
