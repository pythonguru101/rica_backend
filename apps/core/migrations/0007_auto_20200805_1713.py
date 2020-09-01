# Generated by Django 2.0.3 on 2020-08-05 17:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0006_subagent'),
    ]

    operations = [
        migrations.CreateModel(
            name='RicaCustomer',
            fields=[
                ('network', models.CharField(blank=True, max_length=50, null=True)),
                ('new_existing_subscriber', models.CharField(blank=True, max_length=50, null=True)),
                ('register_with', models.CharField(blank=True, max_length=50, null=True)),
                ('sim', models.CharField(max_length=50, primary_key=True, serialize=False)),
                ('last4', models.CharField(blank=True, max_length=4, null=True)),
                ('id_type', models.CharField(blank=True, max_length=50, null=True)),
                ('country', models.CharField(default='South Africa', max_length=50)),
                ('id_number', models.CharField(max_length=50)),
                ('full_name', models.CharField(max_length=50)),
                ('surname', models.CharField(max_length=50)),
                ('country_code', models.CharField(max_length=50)),
                ('area_code', models.CharField(max_length=50)),
                ('dailing_number', models.CharField(max_length=50)),
                ('address1', models.CharField(max_length=100)),
                ('address2', models.CharField(blank=True, max_length=100, null=True)),
                ('address3', models.CharField(blank=True, max_length=100, null=True)),
                ('suburb', models.CharField(max_length=100)),
                ('postal_code', models.CharField(max_length=100)),
                ('city_or_town', models.CharField(max_length=100)),
                ('proof_of_address', models.BooleanField(default=False)),
            ],
            options={
                'ordering': ('network', 'sim'),
            },
        ),
        migrations.AlterModelOptions(
            name='subagent',
            options={'ordering': ('mobile_number', 'name')},
        ),
    ]
