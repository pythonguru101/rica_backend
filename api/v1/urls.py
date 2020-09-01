from django.conf.urls import url, include

from .views import *

import oauth2_provider.views as oauth2_views


# OAuth2 provider endpoints
oauth2_endpoint_views = [
    url(r'^authorize/$', oauth2_views.AuthorizationView.as_view(), name="authorize"),
    url(r'^token/$', oauth2_views.TokenView.as_view(), name="token"),
    url(r'^revoke-token/$', oauth2_views.RevokeTokenView.as_view(), name="revoke-token"),
]

urlpatterns = [
    # club info
    url(r'^monitor/system_info/$', SystemInfoView.as_view()),
    # oauth2
    url(r'^o/', include(oauth2_endpoint_views)),

    # user profile
    url(r'^profile/$', ProfileViewSet.as_view()),

    # rica officer & sub agent login api
    url(r'^rica_user_login/$', RicaUserLoginView.as_view()),

    # rica user officer signup api
    url(r'^rica_user_signup/$', RicaUserSignUpView.as_view()),

    # sub agent signup api
    url(r'^sub_agent_signup/$', SubAgentSignUpView.as_view()),

    # rica customer register api
    url(r'^rica_customer_register/$', RicaCustomerSignUpView.as_view()),

    # id number validation api
    url(r'^id_passport_number_validate/$', IDPassportNumberValidateView.as_view()),

    # password reset api
    url(r'^password_reset/$', PasswordResetView.as_view()),

    # last 10 sub agents
    url(r'^last10_sub_agent/$', Last10RicaAgentView.as_view()),

    # last 10 rica customers
    url(r'^last10_rica_customer/$', Last10RicaCustomerView.as_view()),

    # get login sms otp
    url(r'^login_sms_otp/$', LoginSMSOtpView.as_view()),
]
