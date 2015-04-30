# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import data_ingest.models
from django.conf import settings


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='FileUpload',
            fields=[
                ('id', models.AutoField(serialize=False, verbose_name='ID', primary_key=True, auto_created=True)),
                ('file', models.FileField(upload_to=data_ingest.models.upload_file_path)),
                ('create_datetime', models.DateTimeField(auto_now_add=True)),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL, null=True)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='RawCatch',
            fields=[
                ('id', models.AutoField(serialize=False, verbose_name='ID', primary_key=True, auto_created=True)),
                ('fishing_entity', models.CharField(max_length=200)),
                ('fishing_entity_id', models.IntegerField(default=0)),
                ('original_country_fishing', models.CharField(max_length=200)),
                ('eez_area', models.CharField(max_length=200)),
                ('eez_id', models.IntegerField(default=0)),
                ('eez_sub_area', models.CharField(max_length=200, null=True)),
                ('fao_area', models.CharField(max_length=20, null=True)),
                ('sub_regional_area', models.CharField(max_length=200, null=True)),
                ('province_state', models.CharField(max_length=200, null=True)),
                ('ices_division', models.CharField(max_length=20, null=True)),
                ('ices_subdivision', models.CharField(max_length=20, null=True)),
                ('nafo_division', models.CharField(max_length=20, null=True)),
                ('ccamlr_area', models.CharField(max_length=20, null=True)),
                ('layer', models.IntegerField()),
                ('year', models.IntegerField()),
                ('amount', models.DecimalField(max_digits=20, decimal_places=12)),
                ('adjustment_factor', models.CharField(max_length=200, null=True)),
                # ('gear_type', models.CharField(max_length=200, null=True)),
                # ('gear_type_id', models.IntegerField(default=0)),
                ('taxon_name', models.CharField(max_length=200)),
                ('taxon_key', models.IntegerField(default=0)),
                ('original_fao_name', models.CharField(max_length=200, null=True)),
                ('sector', models.CharField(max_length=200)),
                ('original_sector', models.CharField(max_length=200, null=True)),
                ('sector_id', models.IntegerField(default=0)),
                ('catch_type', models.CharField(max_length=200)),
                ('catch_type_id', models.IntegerField(default=0)),
                ('input_type', models.CharField(max_length=200, null=True)),
                ('reference_id', models.IntegerField(null=True)),
                ('forward_carry_rule', models.CharField(max_length=400, null=True)),
                ('notes', models.CharField(max_length=2000, null=True)),
                ('source_file', models.ForeignKey(to='data_ingest.FileUpload')),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
            options={
            },
            bases=(models.Model,),
        ),
    ]
