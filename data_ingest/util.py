from django.db.models import CharField, TextField
import io
import sys


class NullableCharField(CharField):
    description = 'CharField that stores empty string as NULL'

    def get_db_prep_value(self, value, connection, prepared=False):
        return None if value == '' else value


class NullableTextField(TextField):
    description = 'CharField that stores empty string as NULL'

    def get_db_prep_value(self, value, connection, prepared=False):
        return None if value == '' else value


class IteratorFile(io.TextIOBase):
    """ given an iterator which yields strings
    return a file like object """

    def __init__(self, it):
        self._it = it
        self._f = io.StringIO()

    def read(self, length=sys.maxsize):

        try:
            while self._f.tell() < length:
                self._f.write(next(self._it))

        finally:
            self._f.seek(0)
            data = self._f.read(length)

            # save the remainder for next read
            remainder = self._f.read()
            self._f.seek(0)
            self._f.truncate(0)
            self._f.write(remainder)
            return data

    def readline(self):
        return next(self._it)
