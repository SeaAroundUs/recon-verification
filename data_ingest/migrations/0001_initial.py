# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
from django.conf import settings
import data_ingest.models


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='FileUpload',
            fields=[
                ('id', models.AutoField(primary_key=True, auto_created=True, verbose_name='ID', serialize=False)),
                ('file', models.FileField(upload_to=data_ingest.models.upload_file_path)),
                ('create_datetime', models.DateTimeField(auto_now_add=True)),
                ('user', models.ForeignKey(null=True, to=settings.AUTH_USER_MODEL)),
            ],
        ),
        migrations.CreateModel(
            name='RawCatch',
            fields=[
                ('id', models.AutoField(primary_key=True, auto_created=True, verbose_name='ID', serialize=False)),
                ('fishing_entity', models.CharField(null=True, max_length=200)),
                ('fishing_entity_id', models.IntegerField(default=0)),
                ('original_country_fishing', models.CharField(null=True, max_length=200)),
                ('original_country_fishing_id', models.IntegerField(default=0)),
                ('eez', models.CharField(null=True, max_length=200)),
                ('eez_id', models.IntegerField(default=0)),
                ('eez_sub_area', models.CharField(null=True, max_length=200)),
                ('fao_area', models.CharField(null=True, max_length=20)),
                ('fao_area_id', models.IntegerField(default=0)),
                ('sub_regional_area', models.CharField(null=True, max_length=200)),
                ('province_state', models.CharField(null=True, max_length=200)),
                ('ices_division', models.CharField(null=True, max_length=200)),
                ('ices_division_id', models.IntegerField(default=0)),
                ('ices_subdivision', models.CharField(null=True, max_length=200)),
                ('ices_subdivision_id', models.IntegerField(default=0)),
                ('nafo_division', models.CharField(null=True, max_length=200)),
                ('nafo_division_id', models.IntegerField(default=0)),
                ('ccamlr_area', models.CharField(null=True, max_length=200)),
                ('layer', models.IntegerField(default=0)),
                ('sector', models.CharField(null=True, max_length=200)),
                ('sector_id', models.IntegerField(default=0)),
                ('original_sector', models.CharField(null=True, max_length=200)),
                ('catch_type', models.CharField(null=True, max_length=200)),
                ('catch_type_id', models.IntegerField(default=0)),
                ('year', models.IntegerField(default=0)),
                ('taxon_name', models.CharField(null=True, max_length=200)),
                ('taxon_id', models.IntegerField(default=0)),
                ('original_taxon_name', models.CharField(null=True, max_length=200)),
                ('original_taxon_name_id', models.IntegerField(default=0)),
                ('original_fao_name', models.CharField(null=True, max_length=200)),
                ('original_fao_name_id', models.IntegerField(default=0)),
                ('amount', models.DecimalField(decimal_places=12, max_digits=20)),
                ('adjustment_factor', models.DecimalField(decimal_places=12, max_digits=20)),
                ('gear_type', models.CharField(null=True, max_length=200)),
                ('gear_type_id', models.IntegerField(default=0)),
                ('input_type', models.CharField(null=True, max_length=200)),
                ('input_type_id', models.IntegerField(default=0)),
                ('forward_carry_rule', models.CharField(null=True, max_length=200)),
                ('forward_carry_rule_id', models.IntegerField(default=0)),
                ('disaggregation_rule', models.CharField(null=True, max_length=200)),
                ('disaggregation_rule_id', models.IntegerField(default=0)),
                ('layer_rule', models.CharField(null=True, max_length=200)),
                ('layer_rule_id', models.IntegerField(default=0)),
                ('reference_id', models.IntegerField(default=0, null=True)),
                ('notes', models.TextField(null=True)),
                ('source_file', models.ForeignKey(to='data_ingest.FileUpload')),
                ('user', models.ForeignKey(to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
