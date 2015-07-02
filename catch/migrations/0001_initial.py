# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('data_ingest', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Catch',
            fields=[
                ('id', models.AutoField(serialize=False, verbose_name='ID', auto_created=True, primary_key=True)),
                ('eez_sub_area', models.CharField(max_length=200, null=True)),
                ('subregional_area', models.CharField(max_length=200, null=True)),
                ('province_state', models.CharField(max_length=200, null=True)),
                ('ccamlr_area', models.CharField(max_length=200, null=True)),
                ('layer', models.IntegerField(default=0)),
                ('original_sector', models.CharField(max_length=200, null=True)),
                ('year', models.IntegerField(default=0)),
                ('amount', models.DecimalField(decimal_places=12, max_digits=20)),
                ('adjustment_factor', models.DecimalField(decimal_places=12, null=True, max_digits=20)),
                ('gear_type', models.IntegerField(null=True, default=0)),
                ('input_type', models.IntegerField(null=True, default=0)),
                ('forward_carry_rule', models.IntegerField(null=True, default=0)),
                ('disaggregation_rule', models.IntegerField(null=True, default=0)),
                ('layer_rule', models.IntegerField(null=True, default=0)),
                ('notes', models.TextField(null=True)),
            ],
            options={
                'db_table': 'catch',
            },
        ),
        migrations.CreateModel(
            name='CatchType',
            fields=[
                ('id', models.AutoField(serialize=False, verbose_name='ID', auto_created=True, primary_key=True)),
                ('type', models.CharField(max_length=200)),
            ],
            options={
                'db_table': 'catch_type',
            },
        ),
        migrations.CreateModel(
            name='Country',
            fields=[
                ('id', models.AutoField(serialize=False, verbose_name='ID', auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
            ],
            options={
                'verbose_name_plural': 'Countries',
                'ordering': ['name'],
                'db_table': 'country',
            },
        ),
        migrations.CreateModel(
            name='EEZ',
            fields=[
                ('id', models.AutoField(serialize=False, verbose_name='ID', auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
                ('country', models.ForeignKey(to='catch.Country')),
            ],
            options={
                'verbose_name_plural': 'EEZs',
                'verbose_name': 'EEZ',
                'ordering': ['name'],
                'db_table': 'eez',
            },
        ),
        migrations.CreateModel(
            name='FAO',
            fields=[
                ('id', models.AutoField(serialize=False, verbose_name='ID', auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
            ],
            options={
                'verbose_name_plural': 'FAOs',
                'verbose_name': 'FAO',
                'ordering': ['name'],
                'db_table': 'fao',
            },
        ),
        migrations.CreateModel(
            name='ICES',
            fields=[
                ('id', models.AutoField(serialize=False, verbose_name='ID', auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
            ],
            options={
                'db_table': 'ices_eez',
            },
        ),
        migrations.CreateModel(
            name='NAFO',
            fields=[
                ('id', models.AutoField(serialize=False, verbose_name='ID', auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
            ],
            options={
                'db_table': 'nafo',
            },
        ),
        migrations.CreateModel(
            name='Reference',
            fields=[
                ('id', models.AutoField(serialize=False, verbose_name='ID', auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
            ],
            options={
                'db_table': 'reference',
            },
        ),
        migrations.CreateModel(
            name='Sector',
            fields=[
                ('id', models.AutoField(serialize=False, verbose_name='ID', auto_created=True, primary_key=True)),
                ('name', models.CharField(max_length=200)),
            ],
            options={
                'db_table': 'fishing_sector',
            },
        ),
        migrations.CreateModel(
            name='Taxon',
            fields=[
                ('taxon_key', models.IntegerField(serialize=False, primary_key=True)),
                ('name', models.CharField(max_length=255)),
                ('scientific_name', models.CharField(max_length=255)),
            ],
            options={
                'verbose_name_plural': 'Taxa',
                'ordering': ['scientific_name', 'name'],
                'db_table': 'taxon',
            },
        ),
        migrations.AddField(
            model_name='catch',
            name='catch_type',
            field=models.ForeignKey(to='catch.CatchType'),
        ),
        migrations.AddField(
            model_name='catch',
            name='eez',
            field=models.ForeignKey(to='catch.EEZ'),
        ),
        migrations.AddField(
            model_name='catch',
            name='fao_area',
            field=models.ForeignKey(to='catch.FAO'),
        ),
        migrations.AddField(
            model_name='catch',
            name='fishing_entity',
            field=models.ForeignKey(related_name='+', to='catch.Country'),
        ),
        migrations.AddField(
            model_name='catch',
            name='ices_division',
            field=models.ForeignKey(related_name='+', to='catch.ICES'),
        ),
        migrations.AddField(
            model_name='catch',
            name='ices_subdivision',
            field=models.ForeignKey(related_name='+', to='catch.ICES'),
        ),
        migrations.AddField(
            model_name='catch',
            name='nafo_division',
            field=models.ForeignKey(to='catch.NAFO'),
        ),
        migrations.AddField(
            model_name='catch',
            name='original_country_fishing',
            field=models.ForeignKey(related_name='+', to='catch.Country'),
        ),
        migrations.AddField(
            model_name='catch',
            name='original_fao_name',
            field=models.ForeignKey(related_name='+', to='catch.Taxon'),
        ),
        migrations.AddField(
            model_name='catch',
            name='original_taxon_name',
            field=models.ForeignKey(related_name='+', to='catch.Taxon'),
        ),
        migrations.AddField(
            model_name='catch',
            name='raw_catch',
            field=models.ForeignKey(to='data_ingest.RawCatch'),
        ),
        migrations.AddField(
            model_name='catch',
            name='reference_id',
            field=models.ForeignKey(to='catch.Reference'),
        ),
        migrations.AddField(
            model_name='catch',
            name='sector',
            field=models.ForeignKey(to='catch.Sector'),
        ),
        migrations.AddField(
            model_name='catch',
            name='taxon',
            field=models.ForeignKey(related_name='+', to='catch.Taxon'),
        ),
    ]
