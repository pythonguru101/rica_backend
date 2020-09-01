import logging
import random
import string
import re
import json
from collections import OrderedDict

from django.http import HttpResponseRedirect
from django.shortcuts import render
from django.views.generic import TemplateView
from oauth2_provider.contrib.rest_framework import OAuth2Authentication
from rest_framework import status
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework.views import APIView

from core.models import RicaOfficer, SubAgent, RicaCustomer, SMSOtpHistory
from .rica_fill_bg import AutoFillBot
from django.core import serializers
from django.http import JsonResponse

import logging
import logging.handlers


class ReportView(TemplateView):
    template_name = 'report.html'

    def get(self, request):
        query_results = RicaOfficer.objects.all()
        context = {
            "rica_officers": query_results,
        }
        return render(request, self.template_name, context)


class HomeView(TemplateView):
    template_name = 'home.html'

    def get(self, request):
        return HttpResponseRedirect("/account/login/")


class RicaUserLoginView(APIView):
    """
    Log in API for Rica Officer & Sub Agent.
    [POST] - Check login info of Rica Officer and Sub Agent is correct.
    [username: param]
    [password: param]
    """
    authentication_classes = [OAuth2Authentication, ]
    permission_classes = [IsAuthenticated, ]

    def post(self, request):
        username = str(request.data.get('username'))
        password = request.data.get('password')

        rica_officers = RicaOfficer.objects.filter(mobile_number=username)
        sub_agents = SubAgent.objects.filter(mobile_number=username)

        if len(rica_officers) > 0:
            if password == rica_officers[0].password and rica_officers[0].is_checked is True:
                return Response(
                    OrderedDict([
                        ("response", "success"),
                        ("password", rica_officers[0].password),
                        ("role", "rica officer")
                    ])
                )
            else:
                return Response(
                    OrderedDict([
                        ("response", "failed"),
                        ("password", rica_officers[0].password),
                        ("role", "rica officer")
                    ])
                )

        elif len(sub_agents) > 0:
            if password == sub_agents[0].password:
                return Response(
                    OrderedDict([
                        ("response", "success"),
                        ("password", sub_agents[0].password),
                        ("role", "sub agent")
                    ])
                )
            else:
                return Response(
                    OrderedDict([
                        ("response", "failed"),
                        ("password", sub_agents[0].password),
                        ("role", "sub agent")
                    ])
                )

        else:
            return Response(
                OrderedDict([
                    ("response", "failed")
                ])
            )


class RicaUserSignUpView(APIView):
    """
    Sign up API for new Rica Officer.
    [POST] - Create new Rica Officer.
    [username(mobile_number): param]
    [password: param]
    [confirm_password: param]
    """
    authentication_classes = [OAuth2Authentication, ]
    permission_classes = [IsAuthenticated, ]

    def post(self, request):
        mobile_number = request.data.get('mobile_number')
        if RicaOfficer.objects.filter(mobile_number=mobile_number).exists():
            return Response(
                {
                    "status": "failed",
                    "response": "This rica officer was already created",
                    "is_checked": request.data.get('is_checked')
                },
                status=status.HTTP_400_BAD_REQUEST
            )
        else:
            rica_user = RicaOfficer.objects.create(
                mobile_number=request.data.get('mobile_number'),
                password=request.data.get('password'),
                name=request.data.get('name'),
                id_photo=request.data.get('id_photo'),
                address=request.data.get('address'),
                is_checked=request.data.get('is_checked')
            )

            rica_user.save()
            return Response(
                {
                    "status": "success",
                    "response": "Rica Officer was successfully created",
                    "is_checked": request.data.get('is_checked')
                },
                status=status.HTTP_201_CREATED
            )


class SubAgentSignUpView(APIView):
    """
    Sign up API for new Sub Agent.
    [POST] - Create new Sub Agent.
    [mobile_number: param]
    [name: param]
    [surname: param]
    [id_passport_number: param]
    [id_passport_expiry_date: param]
    [photo_of_id: param]
    [address1: param]
    [address2: param]
    [address3: param]
    [postal_code: param]
    [photo_of_proof: param]
    """
    authentication_classes = [OAuth2Authentication, ]
    permission_classes = [IsAuthenticated, ]

    def get_random_password(self, length):
        # Random string with the combination of lower and upper case
        letters = string.ascii_letters
        result_str = ''.join(random.choice(letters) for i in range(length))
        return result_str

    def post(self, request):
        mobile_number = request.data.get('mobile_number')
        if SubAgent.objects.filter(mobile_number=mobile_number).exists():
            return Response(
                {"status": "failed", "response": "This sub agent was already created"},
                status=status.HTTP_400_BAD_REQUEST
            )
        else:
            password = self.get_random_password(6)
            sub_agent = SubAgent.objects.create(
                mobile_number=request.data.get('mobile_number'),
                password=password,
                name=request.data.get('name'),
                surname=request.data.get('surname'),
                id_passport_number=request.data.get('id_passport_number'),
                id_passport_expiry_date=request.data.get('id_passport_expiry_date'),
                photo_of_id=request.data.get('photo_of_id'),
                address1=request.data.get('address1'),
                address2=request.data.get('address2'),
                address3=request.data.get('address3'),
                postal_code=request.data.get('postal_code'),
                photo_of_proof=request.data.get('photo_of_proof')
            )
            sub_agent.save()

            return Response(
                {"status": "success", "response": password}, status=status.HTTP_201_CREATED
            )


class RicaCustomerSignUpView(APIView):
    """
    Register API for new Rica Customer.
    [POST] - Register new Rica Customer.
    [network: param]
    [new_existing_subscriber: param]
    [register_with: param]
    [sim: param]
    [last4: param]
    [id_type: param]
    [country: param]
    [id_number: param]
    [full_name: param]
    [surname: param]
    [country_code: param]
    [area_code: param]
    [dailing_number: param]
    [address1: param]
    [address2: param]
    [address3: param]
    [suburb: param]
    [postal_code: param]
    [city_or_town: param]
    [proof_of_address: param]
    """
    authentication_classes = [OAuth2Authentication, ]
    permission_classes = [IsAuthenticated, ]

    def post(self, request):
        sim = request.data.get('sim')
        if RicaCustomer.objects.filter(sim=sim).exists():
            return Response(
                {"status": "failed", "response": "This rica customer was already created"},
                status=status.HTTP_400_BAD_REQUEST
            )
        else:
            rica_customer = RicaCustomer.objects.create(
                network=request.data.get('network'),
                new_existing_subscriber=request.data.get('new_existing_subscriber'),
                register_with=request.data.get('register_with'),
                sim=request.data.get('sim'),
                last4=request.data.get('last4'),
                id_type=request.data.get('id_type'),
                country=request.data.get('country'),
                id_number=request.data.get('id_number'),
                full_name=request.data.get('full_name'),
                surname=request.data.get('surname'),
                country_code=request.data.get('country_code'),
                area_code=request.data.get('area_code'),
                dailing_number=request.data.get('dailing_number'),
                address1=request.data.get('address1'),
                address2=request.data.get('address2'),
                address3=request.data.get('address3'),
                suburb=request.data.get('suburb'),
                postal_code=request.data.get('postal_code'),
                city_or_town=request.data.get('city_or_town'),
                proof_of_address=request.data.get('proof_of_address')
            )
            rica_customer.save()
            # bot = AutoFillBot(username="HHAWP", password="GG0saJoE")
            bot = AutoFillBot(username="QYSLE", password="ewiSADPw")

            if bot.login():
                print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
                bot.fill_form(
                    request.data.get('network'),
                    request.data.get('new_existing_subscriber'),
                    request.data.get('register_with'),
                    request.data.get('sim'),
                    request.data.get('last4'),
                    request.data.get('id_type'),
                    request.data.get('country'),
                    request.data.get('id_number'),
                    request.data.get('full_name'),
                    request.data.get('surname'),
                    request.data.get('country_code'),
                    request.data.get('area_code'),
                    request.data.get('dailing_number'),
                    request.data.get('address1'),
                    request.data.get('address2'),
                    request.data.get('address3'),
                    request.data.get('suburb'),
                    request.data.get('postal_code'),
                    request.data.get('city_or_town'),
                    request.data.get('proof_of_address')
                )

                rica_customer.status = "success"
                rica_customer.description = "success"
                rica_customer.save()

                return Response(
                    {"status": "success"},
                    status=status.HTTP_201_CREATED
                )
            else:
                print("BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB")

                rica_customer.status = "failed"
                rica_customer.description = "failed"
                rica_customer.save()

                return Response(
                    {"status": "failed"},
                    status=status.HTTP_400_BAD_REQUEST
                )


class IDPassportNumberValidateView(APIView):
    """
    ID Number or Passport Number Validation API
    [POST] - Validate ID Number or Passport Number.
    [id_or_passport_num: param]
    """
    authentication_classes = [OAuth2Authentication, ]
    permission_classes = [IsAuthenticated, ]

    def __init__(self):
        self.isValid = False

    def post(self, request):
        number = request.data.get('id_or_passport_num')
        try:
            if number is None:
                return Response({"validation": self.isValid})

            if len(number) == 8:
                if re.match('[a-zA-Z]{1}[0-9]{7}', number):
                    return Response({"validation": True})
                else:
                    return Response({"validation": False})

            if len(number) == 9:
                if re.match('[a-zA-Z]{2}[0-9]{7}', number) or re.match('[a-zA-Z]{1}[0-9]{8}', number):
                    return Response({"validation": True})
                else:
                    return Response({"validation": False})

            if len(number) == 10:
                if re.match('[0-9]{10}', number):
                    return Response({"validation": True})
                else:
                    return Response({"validation": False})

            if isinstance(number, str) and number.find(' ') >= 0:
                number = number.replace(' ', '')
            self.isValid = number.isdigit() and len(number) == 13
            if self.isValid:
                index = 1
                evens = ""
                numArray = list(number)
                total = 0
                while index < 13:
                    if index % 2 == 0:
                        evens = evens + numArray[index - 1]
                    else:
                        total = total + int(numArray[index - 1])
                    index = index + 1
                evensArr = list(str(int(evens) * 2))
                evenTotalArrSum = sum(int(val) for val in evensArr)
                evenOdd = total + evenTotalArrSum
                evenOddsArr = list(str(evenOdd))
                self.isValid = int(numArray[12]) == 10 - int(evenOddsArr[1])

            return Response({"validation": self.isValid})
        except Exception:
            self.isValid = False
            return Response({"validation": self.isValid})


class PasswordResetView(APIView):
    """
    Rica Officer and Sub Agent's password reset API.
    [POST] - Reset Rica Officer and Sub Agent's password.
    [username(mobile_number): param]
    [old_password: param]
    [new_password: param]
    """
    authentication_classes = [OAuth2Authentication, ]
    permission_classes = [IsAuthenticated, ]

    def post(self, request):
        mobile_number = request.data.get('username')
        old_password = request.data.get('old_password')
        new_password = request.data.get('new_password')

        try:
            rica_officer = RicaOfficer.objects.get(mobile_number=mobile_number, password=old_password)
            rica_officer.password = new_password
            rica_officer.save()
            return Response(
                {"status": "Password was changed successfully"}
            )
        except RicaOfficer.DoesNotExist:
            rica_officer = None

        try:
            sub_agent = SubAgent.objects.get(mobile_number=mobile_number, password=old_password)
            sub_agent.password = new_password
            sub_agent.save()
            return Response(
                {"status": "Password was changed successfully"}
            )
        except SubAgent.DoesNotExist:
            sub_agent = None

        if rica_officer is None or sub_agent is None:
            return Response(
                {"status": "Can't find mobile number"}
            )


class Last10RicaAgentView(APIView):
    """
    API to get last 10 Rica sub agents list.
    [GET] - Get last 10 Rica sub agents list.
    """
    authentication_classes = [OAuth2Authentication, ]
    permission_classes = [IsAuthenticated, ]

    def get(self, request):
        query_results = SubAgent.objects.all().order_by('-created')[:10]
        json_str = serializers.serialize("json", query_results)
        # print("---------------------", json.loads(json_str))
        result = {
            "last10_subagents": json.loads(json_str),
        }
        return Response(result)


class Last10RicaCustomerView(APIView):
    """
    API to get last 10 Rica customers list.
    [GET] - Get last 10 Rica customers list.
    """
    authentication_classes = [OAuth2Authentication, ]
    permission_classes = [IsAuthenticated, ]

    def get(self, request):
        query_results = RicaCustomer.objects.all().order_by('-created')[:10]
        json_str = serializers.serialize("json", query_results)
        # print("---------------------", json.loads(json_str))
        result = {
            "last10_rica_customers": json.loads(json_str),
        }
        return Response(result)


class LoginSMSOtpView(APIView):
    """
    API to get sms otp code
    [POST] - Get sms otp code.
    """
    # authentication_classes = [OAuth2Authentication, ]
    # permission_classes = [IsAuthenticated, ]

    def post(self, request):
        my_logger = logging.getLogger('MyLogger')
        my_logger.setLevel(logging.DEBUG)
        handler = logging.handlers.SysLogHandler(address='/dev/log')
        my_logger.addHandler(handler)
        my_logger.debug('========== [Start OTP DEBUG LOG] ==========\n')
        my_logger.info(request.body)
        my_logger.debug('========== [End OTP DEBUG LOG] ==========\n')

        otp_history = SMSOtpHistory.objects.create(
            content=request.body
        )
        otp_history.save()

        # result = {
        #     "result": "success",
        # }

        return Response(status=status.HTTP_200_OK)
