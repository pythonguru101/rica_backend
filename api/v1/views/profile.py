from django.conf import settings
import datetime
from datetime import timedelta
from django.contrib.auth import get_user_model
from django.contrib.auth.hashers import make_password

from rest_framework import status
from rest_framework import generics
import pytz
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.permissions import AllowAny, IsAdminUser, IsAuthenticated

from api.v1.serializers import ProfileSerializer

from oauth2_provider.models import get_application_model
from oauth2_provider.contrib.rest_framework import TokenHasReadWriteScope, OAuth2Authentication
import stripe
import json
import math
import requests


class ProfileViewSet(generics.RetrieveUpdateAPIView):
    """
    Get/Update Profile

    - subscription_status
        * 0: not subscribed
        * 1: subscribed and active
        * 2: subscribed but inactive
    """
    authentication_classes = [OAuth2Authentication, ]
    permission_classes = [IsAuthenticated, ]

    serializer_class = ProfileSerializer

    def get_object(self):
        return self.request.user
