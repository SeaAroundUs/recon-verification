from django.db import connection
from django.core.urlresolvers import reverse


# this class helps manage the Custom Views section of the site
class Custom:
    # this method returns a list of custom views as instances of this class
    @classmethod
    def view_list(cls):
        with connection.cursor() as cursor:
            cursor.execute("SELECT table_name FROM INFORMATION_SCHEMA.views WHERE table_name LIKE 'v_custom_%' Order by table_name;")
            return [cls(row[0]) for row in cursor.fetchall()]

    # an instance of this class represents a specific custom view
    def __init__(self, view_name):
        self.view_name = view_name

    # the url to access a specific custom view
    def url(self):
        return '%s?view=%s' % (reverse('custom'), self.view_name)

    # converts a view name like "v_custom_rfmo_view" to "RFMO view"
    def pretty_title(self):
        uppercase_words = [
            "id", "eez", "lme", "rfmo", "fao", "ices", "nafo", "meow"
        ]
        name = self.view_name \
            .replace('v_custom_', '') \
            .replace('_', ' ')
        for word in uppercase_words:
            name = name.replace(word, word.upper())
        name = name[:1].upper() + name[1:]
        return name

    # this method returns a list of values, with the first row being a list of column names
    def results(self):
        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM %s;" % self.view_name)
            return [tuple(col[0] for col in cursor.description)] + cursor.fetchall()

    def __str__(self):
        return self.pretty_title()
