from django.db import models
from django.contrib.auth.models import User


class TableEdit(models.Model):
    id = models.AutoField(primary_key=True)
    auth_user = models.ForeignKey(to=User)
    table_name = models.CharField(max_length=256)
    notes = models.TextField()

    class Meta:
        db_table = 'table_edits'
        managed = False

    @classmethod
    def log_insert(cls, user, table_name, num_rows):
        cls.__log(user, table_name, "inserted %s row(s)" % num_rows)

    @classmethod
    def log_update(cls, user, table_name, num_rows):
        cls.__log(user, table_name, "updated %s row(s)" % num_rows)

    @classmethod
    def log_delete(cls, user, table_name, num_rows):
        cls.__log(user, table_name, "deleted %s row(s)" % num_rows)

    @classmethod
    def __log(cls, user, table_name, notes):
        cls(auth_user=user, table_name=table_name, notes=notes).save()
