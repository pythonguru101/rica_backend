from django.db import models
from django.db.models import Sum
from django.contrib.postgres.fields import JSONField
from django.contrib.postgres.fields import ArrayField
from django.conf import settings
from django.utils.translation import ugettext_lazy as _
from model_utils import Choices
import django.utils.timezone


class RicaOfficer(models.Model):
    mobile_number = models.CharField(max_length=100, primary_key=True)
    password = models.CharField(max_length=100, null=True, blank=True)
    name = models.CharField(max_length=50, null=True, blank=True)
    id_photo = models.ImageField(null=True, blank=True)
    address = models.CharField(max_length=100, null=True, blank=True)
    is_checked = models.BooleanField(default=False)

    @property
    def is_valid(self):
        try:
            if self.reports.count() > 0:
                return True
        except Exception:
            pass

        return False

    @property
    def reports(self):
        return RicaOfficer.objects.get()

    class Meta:
        ordering = ('mobile_number', 'name')


class SubAgent(models.Model):
    mobile_number = models.CharField(max_length=100, primary_key=True)
    password = models.CharField(max_length=100, null=True, blank=True)
    name = models.CharField(max_length=50, null=True, blank=True)
    surname = models.CharField(max_length=50, null=True, blank=True)
    id_passport_number = models.CharField(max_length=50, null=True, blank=True)
    id_passport_expiry_date = models.DateField(null=True, blank=True)
    photo_of_id = models.ImageField(null=True, blank=True)
    address1 = models.CharField(max_length=100, null=True, blank=True)
    address2 = models.CharField(max_length=100, null=True, blank=True)
    address3 = models.CharField(max_length=100, null=True, blank=True)
    postal_code = models.CharField(max_length=100, null=True, blank=True)
    photo_of_proof = models.ImageField(null=True, blank=True)
    created = models.DateTimeField(default=django.utils.timezone.now)

    class Meta:
        ordering = ('mobile_number', 'name')


class RicaCustomer(models.Model):
    STATUS = (
        ('success', 'success'),
        ('failed', 'failed'),
        ('unknown', 'unknown'),
    )

    network = models.CharField(max_length=50, null=True, blank=True)
    new_existing_subscriber = models.CharField(max_length=50, null=True, blank=True)
    register_with = models.CharField(max_length=50, null=True, blank=True)
    sim = models.CharField(max_length=50, primary_key=True)
    last4 = models.CharField(max_length=4, null=True, blank=True)
    id_type = models.CharField(max_length=50, null=True, blank=True)
    country = models.CharField(max_length=50, default="South Africa")
    id_number = models.CharField(max_length=50)
    full_name = models.CharField(max_length=50)
    surname = models.CharField(max_length=50)
    country_code = models.CharField(max_length=50)
    area_code = models.CharField(max_length=50)
    dailing_number = models.CharField(max_length=50)
    address1 = models.CharField(max_length=100)
    address2 = models.CharField(max_length=100, null=True, blank=True)
    address3 = models.CharField(max_length=100, null=True, blank=True)
    suburb = models.CharField(max_length=100)
    postal_code = models.CharField(max_length=100)
    city_or_town = models.CharField(max_length=100)
    proof_of_address = models.BooleanField(default=False)
    created = models.DateTimeField(default=django.utils.timezone.now)
    otp = models.CharField(max_length=50, unique=True, null=True, blank=True, default=None)  # new
    status = models.CharField(max_length=10, choices=STATUS, default='unknown')  # new
    description = models.TextField(null=True, blank=True, default=None)  # new

    class Meta:
        ordering = ('network', 'sim')


class SMSOtpHistory(models.Model):
    content = models.TextField(null=True, blank=True, default=None)
    created = models.DateTimeField(default=django.utils.timezone.now)

    class Meta:
        ordering = ('content', 'created')
