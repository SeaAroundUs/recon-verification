# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('catch', '0001_initial'),
    ]

    operations = [
        migrations.RenameField(
            model_name='eez',
            old_name='area',
            new_name='name',
        ),
        migrations.RemoveField(
            model_name='eez',
            name='sub_area',
        ),
    ]
