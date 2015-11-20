from django.db.models import CharField, TextField


class NullableCharField(CharField):
    description = 'CharField that stores empty string as NULL'

    def get_db_prep_value(self, value, connection, prepared=False):
        return None if value == '' else value


class NullableTextField(TextField):
    description = 'CharField that stores empty string as NULL'

    def get_db_prep_value(self, value, connection, prepared=False):
        return None if value == '' else value
