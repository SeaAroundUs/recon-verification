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
                ('id', models.AutoField(serialize=False, verbose_name='ID', primary_key=True, auto_created=True)),
                ('year', models.IntegerField()),
                ('amount', models.DecimalField(max_digits=20, decimal_places=12)),
                ('fao_area', models.CharField(max_length=20, null=True)),
                ('sub_regional_area', models.CharField(max_length=200, null=True)),
                ('province_state', models.CharField(max_length=200, null=True)),
                ('ices_division', models.CharField(max_length=20, null=True)),
                ('ices_subdivision', models.CharField(max_length=20, null=True)),
                ('nafo_division', models.CharField(max_length=20, null=True)),
                ('ccamlr_area', models.CharField(max_length=20, null=True)),
                ('input_type', models.CharField(max_length=200, null=True)),
                ('reference_id', models.IntegerField(null=True)),
                ('forward_carry_rule', models.CharField(max_length=400, null=True)),
                ('adjustment_factor', models.CharField(max_length=200, null=True)),
                ('gear', models.CharField(max_length=200, null=True)),
                ('notes', models.CharField(max_length=2000, null=True)),
            ],
            options={
                'db_table': 'reconstructed_catch',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='CatchType',
            fields=[
                ('id', models.AutoField(serialize=False, verbose_name='ID', primary_key=True, auto_created=True)),
                ('type', models.CharField(max_length=200)),
            ],
            options={
                'db_table': 'catch_type',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Country',
            fields=[
                ('id', models.AutoField(serialize=False, verbose_name='ID', primary_key=True, auto_created=True)),
                ('name', models.CharField(max_length=200)),
            ],
            options={
                'verbose_name_plural': 'Countries',
                'db_table': 'country',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='EEZ',
            fields=[
                ('id', models.AutoField(serialize=False, verbose_name='ID', primary_key=True, auto_created=True)),
                ('area', models.CharField(max_length=200)),
                ('sub_area', models.CharField(max_length=200)),
                ('country', models.ForeignKey(to='catch.Country')),
            ],
            options={
                'verbose_name': 'EEZ',
                'verbose_name_plural': 'EEZs',
                'db_table': 'eez',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Reference',
            fields=[
                ('id', models.AutoField(serialize=False, verbose_name='ID', primary_key=True, auto_created=True)),
                ('name', models.CharField(max_length=200)),
            ],
            options={
                'db_table': 'reference',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Sector',
            fields=[
                ('id', models.AutoField(serialize=False, verbose_name='ID', primary_key=True, auto_created=True)),
                ('name', models.CharField(max_length=200)),
            ],
            options={
                'db_table': 'fishing_sector',
            },
            bases=(models.Model,),
        ),
        migrations.CreateModel(
            name='Taxon',
            fields=[
                ('taxon_key', models.IntegerField(serialize=False, primary_key=True)),
                ('name', models.CharField(max_length=255)),
                ('scientific_name', models.CharField(max_length=255)),
            ],
            options={
                'ordering': ['scientific_name', 'name'],
                'verbose_name_plural': 'Taxa',
                'db_table': 'taxon',
            },
            bases=(models.Model,),
        ),
        migrations.AddField(
            model_name='catch',
            name='catch_type',
            field=models.ForeignKey(to='catch.CatchType'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='catch',
            name='eez',
            field=models.ForeignKey(to='catch.EEZ'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='catch',
            name='fishing_entity',
            field=models.ForeignKey(related_name='fishing_entity', to='catch.Country'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='catch',
            name='original_country_fishing',
            field=models.ForeignKey(related_name='original_country_fishing', to='catch.Country'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='catch',
            name='raw_catch',
            field=models.ForeignKey(to='data_ingest.RawCatch'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='catch',
            name='sector',
            field=models.ForeignKey(to='catch.Sector'),
            preserve_default=True,
        ),
        migrations.AddField(
            model_name='catch',
            name='taxon',
            field=models.ForeignKey(to='catch.Taxon'),
            preserve_default=True,
        ),
    ]
