# Generated by Django 2.0.3 on 2020-07-26 17:52

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='RicaUser',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('mobile_number', models.CharField(blank=True, max_length=100, null=True)),
                ('name', models.CharField(blank=True, max_length=50, null=True)),
                ('surname', models.CharField(blank=True, max_length=50, null=True)),
                ('id_passport', models.CharField(blank=True, max_length=50, null=True)),
                ('selfie_photo', models.ImageField(blank=True, null=True, upload_to='')),
                ('id_photo', models.ImageField(blank=True, null=True, upload_to='')),
                ('proof_of_address', models.BooleanField(default=True)),
                ('address', models.CharField(blank=True, max_length=100, null=True)),
                ('id_pasport_expiry_date', models.DateField(blank=True, null=True)),
                ('area_code', models.CharField(blank=True, max_length=50, null=True)),
                ('dailing_number', models.CharField(blank=True, max_length=50, null=True)),
                ('suburb', models.CharField(blank=True, max_length=50, null=True)),
                ('postal_code', models.CharField(blank=True, max_length=50, null=True)),
                ('city_town', models.CharField(blank=True, max_length=100, null=True)),
                ('country', models.CharField(blank=True, max_length=100, null=True)),
            ],
            options={
                'ordering': ('mobile_number', 'name'),
            },
        ),
    ]