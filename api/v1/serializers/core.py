from django.contrib.auth import get_user_model
from rest_framework import serializers
from core.models import RicaOfficer


User = get_user_model()


class ProfileSerializer(serializers.ModelSerializer):

    class Meta:
        model = User
        fields = ('id', 'username', 'email', 'first_name', 'last_name',
                  'birthday', 'location', 'creation_time', 'photo')
        read_only_fields = ('username', 'email', 'photo')

    def update(self, instance, validated_data):
        instance.first_name = validated_data.get('first_name', instance.first_name)
        instance.last_name = validated_data.get('last_name', instance.last_name)
        instance.birthday = validated_data.get('birthday', instance.birthday)
        instance.location = validated_data.get('location', instance.location)
        instance.creation_time = validated_data.get('creation_time', instance.creation_time)
        instance.save()

        return instance


class RicaUserSerializer(serializers.ModelSerializer):

    class Meta:
        # Read only Serializer
        model = RicaOfficer
        fields = ('mobile_number', 'name', 'id_photo', 'address', 'is_checked')

    def update(self, instance, validated_data):
        instance.name = validated_data.get('name', instance.name)
        instance.id_photo = validated_data.get('id_photo', instance.id_photo)
        instance.address = validated_data.get('address', instance.address)
        instance.save()

        return instance
