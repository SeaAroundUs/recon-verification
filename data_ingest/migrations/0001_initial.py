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
                ('id', models.AutoField(serialize=False, verbose_name='ID', auto_created=True, primary_key=True)),
                ('file', models.FileField(upload_to=data_ingest.models.upload_file_path)),
                ('create_datetime', models.DateTimeField(auto_now_add=True)),
                ('user', models.ForeignKey(null=True, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='RawCatch',
            fields=[
                ('id', models.AutoField(serialize=False, verbose_name='ID', auto_created=True, primary_key=True)),
                ('fishing_entity', models.CharField(max_length=200, null=True)),
                ('fishing_entity_id', models.IntegerField(default=0)),
                ('original_country_fishing', models.CharField(max_length=200, null=True)),
                ('original_country_fishing_id', models.IntegerField(default=0)),
                ('eez', models.CharField(max_length=200, null=True)),
                ('eez_id', models.IntegerField(default=0)),
                ('eez_sub_area', models.CharField(max_length=200, null=True)),
                ('fao_area', models.CharField(max_length=20, null=True)),
                ('fao_area_id', models.IntegerField(default=0)),
                ('subregional_area', models.CharField(max_length=200, null=True)),
                ('province_state', models.CharField(max_length=200, null=True)),
                ('ices_division', models.CharField(max_length=200, null=True)),
                ('ices_division_id', models.IntegerField(default=0)),
                ('ices_subdivision', models.CharField(max_length=200, null=True)),
                ('ices_subdivision_id', models.IntegerField(default=0)),
                ('nafo_division', models.CharField(max_length=200, null=True)),
                ('nafo_division_id', models.IntegerField(default=0)),
                ('ccamlr_area', models.CharField(max_length=200, null=True)),
                ('layer', models.IntegerField(default=0)),
                ('sector', models.CharField(max_length=200, null=True)),
                ('sector_id', models.IntegerField(default=0)),
                ('original_sector', models.CharField(max_length=200, null=True)),
                ('catch_type', models.CharField(max_length=200, null=True)),
                ('catch_type_id', models.IntegerField(default=0)),
                ('year', models.IntegerField(default=0)),
                ('taxon_name', models.CharField(max_length=200, null=True)),
                ('taxon_id', models.IntegerField(default=0)),
                ('original_taxon_name', models.CharField(max_length=200, null=True)),
                ('original_taxon_name_id', models.IntegerField(default=0)),
                ('original_fao_name', models.CharField(max_length=200, null=True)),
                ('original_fao_name_id', models.IntegerField(default=0)),
                ('amount', models.DecimalField(decimal_places=12, max_digits=20)),
                ('adjustment_factor', models.DecimalField(decimal_places=12, null=True, max_digits=20)),
                ('gear_type', models.CharField(max_length=200, null=True)),
                ('gear_type_id', models.IntegerField(default=0)),
                ('input_type', models.CharField(max_length=200, null=True)),
                ('input_type_id', models.IntegerField(default=0)),
                ('forward_carry_rule', models.CharField(max_length=200, null=True)),
                ('forward_carry_rule_id', models.IntegerField(default=0)),
                ('disaggregation_rule', models.CharField(max_length=200, null=True)),
                ('disaggregation_rule_id', models.IntegerField(default=0)),
                ('layer_rule', models.CharField(max_length=200, null=True)),
                ('layer_rule_id', models.IntegerField(default=0)),
                ('reference_id', models.IntegerField(null=True, default=0)),
                ('notes', models.TextField(null=True)),
                ('source_file', models.ForeignKey(to='data_ingest.FileUpload')),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
