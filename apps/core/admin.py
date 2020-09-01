from django.contrib import admin
from rangefilter.filter import DateRangeFilter, DateTimeRangeFilter

from .models import RicaOfficer, SubAgent, RicaCustomer, SMSOtpHistory


class RicaOfficerAdmin(admin.ModelAdmin):
    list_display = ('mobile_number', 'name', 'id_photo', 'address', 'is_checked')
    list_filter = ('mobile_number', 'name')


class SubAgentAdmin(admin.ModelAdmin):
    list_display = ('mobile_number', 'name', 'surname', 'id_passport_number', 'id_passport_expiry_date', 'photo_of_id',
                    'address1', 'address2', 'address3', 'postal_code', 'photo_of_proof')
    list_filter = ('mobile_number', 'name')


class RicaCustomerAdmin(admin.ModelAdmin):
    list_display = ('network', 'new_existing_subscriber', 'register_with', 'sim', 'last4', 'id_type', 'country',
                    'id_number', 'full_name', 'surname', 'country_code', 'area_code', 'dailing_number', 'address1',
                    'address2', 'address3', 'suburb', 'postal_code', 'city_or_town', 'proof_of_address')
    list_filter = ('network', 'sim')


class SMSOtpHistoryAdmin(admin.ModelAdmin):
    list_display = ('content', 'created')
    list_filter = ('content', 'created')


admin.site.register(RicaOfficer, RicaOfficerAdmin)
admin.site.register(SubAgent, SubAgentAdmin)
admin.site.register(RicaCustomer, RicaCustomerAdmin)
admin.site.register(SMSOtpHistory, SMSOtpHistoryAdmin)
