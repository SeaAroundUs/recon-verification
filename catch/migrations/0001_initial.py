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
                ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True, serialize=False)),
                ('eez_sub_area', models.CharField(null=True, max_length=200)),
                ('subregional_area', models.CharField(null=True, max_length=200)),
                ('province_state', models.CharField(null=True, max_length=200)),
                ('ccamlr_area', models.CharField(null=True, max_length=200)),
                ('layer', models.IntegerField(default=0)),
                ('original_sector', models.CharField(null=True, max_length=200)),
                ('year', models.IntegerField(default=0)),
                ('amount', models.DecimalField(decimal_places=12, max_digits=20)),
                ('adjustment_factor', models.DecimalField(null=True, decimal_places=12, max_digits=20)),
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
                ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True, serialize=False)),
                ('type', models.CharField(max_length=200)),
            ],
            options={
                'db_table': 'catch_type',
            },
        ),
        migrations.CreateModel(
            name='Country',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True, serialize=False)),
                ('name', models.CharField(max_length=200)),
            ],
            options={
                'db_table': 'country',
                'verbose_name_plural': 'Countries',
                'ordering': ['name'],
            },
        ),
        migrations.CreateModel(
            name='EEZ',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True, serialize=False)),
                ('name', models.CharField(max_length=200)),
                ('country', models.ForeignKey(to='catch.Country')),
            ],
            options={
                'verbose_name': 'EEZ',
                'db_table': 'eez',
                'verbose_name_plural': 'EEZs',
                'ordering': ['name'],
            },
        ),
        migrations.CreateModel(
            name='FAO',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True, serialize=False)),
                ('name', models.CharField(max_length=200)),
            ],
            options={
                'verbose_name': 'FAO',
                'db_table': 'fao',
                'verbose_name_plural': 'FAOs',
                'ordering': ['name'],
            },
        ),
        migrations.CreateModel(
            name='ICES',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True, serialize=False)),
                ('name', models.CharField(max_length=200)),
            ],
            options={
                'db_table': 'ices_eez',
            },
        ),
        migrations.CreateModel(
            name='NAFO',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True, serialize=False)),
                ('name', models.CharField(max_length=200)),
            ],
            options={
                'db_table': 'nafo',
            },
        ),
        migrations.CreateModel(
            name='Reference',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True, serialize=False)),
                ('name', models.CharField(max_length=200)),
            ],
            options={
                'db_table': 'reference',
            },
        ),
        migrations.CreateModel(
            name='Sector',
            fields=[
                ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True, serialize=False)),
                ('name', models.CharField(max_length=200)),
            ],
            options={
                'db_table': 'fishing_sector',
            },
        ),
        migrations.CreateModel(
            name='Taxon',
            fields=[
                ('taxon_key', models.IntegerField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=255)),
                ('scientific_name', models.CharField(max_length=255)),
            ],
            options={
                'db_table': 'taxon',
                'verbose_name_plural': 'Taxa',
                'ordering': ['scientific_name', 'name'],
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
            field=models.ForeignKey(to='catch.Country', related_name='+'),
        ),
        migrations.AddField(
            model_name='catch',
            name='ices_division',
            field=models.ForeignKey(to='catch.ICES', related_name='+'),
        ),
        migrations.AddField(
            model_name='catch',
            name='ices_subdivision',
            field=models.ForeignKey(to='catch.ICES', related_name='+'),
        ),
        migrations.AddField(
            model_name='catch',
            name='nafo_division',
            field=models.ForeignKey(to='catch.NAFO'),
        ),
        migrations.AddField(
            model_name='catch',
            name='original_country_fishing',
            field=models.ForeignKey(to='catch.Country', related_name='+'),
        ),
        migrations.AddField(
            model_name='catch',
            name='original_fao_name',
            field=models.ForeignKey(to='catch.Taxon', related_name='+'),
        ),
        migrations.AddField(
            model_name='catch',
            name='original_taxon_name',
            field=models.ForeignKey(to='catch.Taxon', related_name='+'),
        ),
        migrations.AddField(
            model_name='catch',
            name='raw_catch',
            field=models.ForeignKey(to='data_ingest.RawCatch'),
        ),
        migrations.AddField(
            model_name='catch',
            name='reference',
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
            field=models.ForeignKey(to='catch.Taxon', related_name='+'),
        ),
    ]
