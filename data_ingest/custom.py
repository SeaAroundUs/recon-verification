from django.db import connection
from django.core.urlresolvers import reverse


class Custom:
    @classmethod
    def view_list(cls):
        with connection.cursor() as cursor:
            cursor.execute("SELECT table_name FROM INFORMATION_SCHEMA.views WHERE table_name LIKE 'v_custom_%';")
            return [cls(row[0]) for row in cursor.fetchall()]

    def __init__(self, view_name):
        self.view_name = view_name

    def url(self):
        return '%s?view=%s' % (reverse('custom'), self.view_name)

    def pretty_title(self):
        uppercase_words = [
            "id", "eez", "lme", "rfmo", "fao", "ices", "nafo"
        ]
        name = self.view_name \
            .replace('v_custom_', '') \
            .replace('_', ' ')
        for word in uppercase_words:
            name = name.replace(word, word.upper())
        return name

    def results(self):
        with connection.cursor() as cursor:
            cursor.execute("SELECT * FROM %s;" % self.view_name)
            return [tuple(col[0] for col in cursor.description)] + cursor.fetchall()

    def __str__(self):
        return self.pretty_title()
