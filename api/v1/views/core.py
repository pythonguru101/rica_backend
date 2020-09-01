from collections import OrderedDict

import linux_metrics as lm
from oauth2_provider.contrib.rest_framework import OAuth2Authentication
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import generics
from api.v1.serializers import RicaUserSerializer

from django.conf import settings
import datetime
from datetime import timedelta
from django.contrib.auth import get_user_model
from django.contrib.auth.hashers import make_password

from oauth2_provider.models import get_application_model

import json
import math
import requests
import pytz


class SystemInfoView(APIView):
    """
    SystemInfo response should be
    - "procs_running"=<int_value>
    - "cpu_utilization"=<float_value>
    - "disk_busy"=<string_value>
    - "disk_reads"=<string_value>
    - "disk_writes"=<string_value>
    - "memory_used"=<string_value>
    - "memory_total"=<string_value>
    - "network_bits_received"=<string_value>
    - "network_bits_sent"=<string_value>
    """
    authentication_classes = [OAuth2Authentication, ]
    permission_classes = [IsAuthenticated, ]

    def get(self, request, *args, **kwargs):
        # cpu
        procs_running = lm.cpu_stat.procs_running()
        cpu_pcts = lm.cpu_stat.cpu_percents(sample_duration=1)
        cpu_utilization = 100 - cpu_pcts['idle']

        # disk
        disk_busy = lm.disk_stat.disk_busy('sda', sample_duration=1)
        disk_reads, disk_writes = lm.disk_stat.disk_reads_writes('sda1')

        # memory
        used, total, _, _, _, _ = lm.mem_stat.mem_stats()

        # network
        # rx_bits, tx_bits = lm.net_stat.rx_tx_bits('enp4s0')

        return Response(OrderedDict([
            ("procs_running", procs_running),
            ("cpu_utilization", cpu_utilization),
            ("disk_busy", disk_busy),
            ("disk_reads", disk_reads),
            ("disk_writes", disk_writes),
            ("memory_used", used),
            ("memory_total", total),
            ("network_bits_received", ""),
            ("network_bits_sent", ""),
        ])
        )


# class RicaUserViewSet(generics.RetrieveUpdateAPIView):
#     """
#     Rica User list
#     * All rica users should be returned.
#     """
#     authentication_classes = [OAuth2Authentication, ]
#     permission_classes = [IsAuthenticated, ]
#     serializer_class = RicaUserSerializer
#
#     def get_object(self):
#         return self.request.user

