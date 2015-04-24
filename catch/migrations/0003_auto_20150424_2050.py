# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('catch', '0002_auto_20150403_0935'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='country',
            options={'verbose_name_plural': 'Countries', 'ordering': ['name']},
        ),
        migrations.AlterModelOptions(
            name='eez',
            options={'verbose_name_plural': 'EEZs', 'ordering': ['name'], 'verbose_name': 'EEZ'},
        ),
    ]
