# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.db import migrations
from catch.data import load_standing_data


class Migration(migrations.Migration):

    dependencies = [
        ('catch', '0001_initial'),
    ]

    operations = [
        migrations.RunPython(load_standing_data)
    ]
