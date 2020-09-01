import logging
import time

import requests
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.firefox.options import Options
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.support.ui import WebDriverWait

from core.models import RicaOfficer, SubAgent, RicaCustomer

RICA_URL = "https://www.ricaonline.co.za"
RICA_REGISTER_URL = "https://www.ricaonline.co.za/#/subscription"

# login_needed can be integer 0 or 1, 0 in case you've memorized login in profile
login_needed = 0.5

# process_sleep in seconds is wait period when switching to next field. 0.5 is half a second.
process_sleep = 0.5

# seconds to wait after clicking on submit
wait_after_submit = 20

# sleeping after clearing text field
sleep_after_clear = 0.3


class AutoFillBot:
    """AutoFillBot class"""

    def __init__(self, username, password):
        self.username = username
        self.password = password
        self.isloggedin = None
        self.error_msg = ''
        self.flag = True

        options = Options()
        # options.add_argument("--headless")
        capabilities = webdriver.DesiredCapabilities.FIREFOX
        capabilities["marionette"] = True
        self.driver = webdriver.Firefox(firefox_options=options, capabilities=capabilities)

        cookies = self.driver.get_cookies()
        s = requests.Session()
        for cookie in cookies:
            s.cookies.set(cookie['name'], cookie['value'])

        self.driver.implicitly_wait(3)

    def __del__(self):
        if self.driver:
            self.driver.quit()

    def login(self):
        logging.warning('{}, {}'.format(self.username, self.password))
        try:
            self.driver.get(RICA_URL)
            self.driver.find_element_by_xpath('//input[@name="email"]').send_keys(self.username)
            time.sleep(1)
            self.driver.find_element_by_xpath('//input[@name="password"]').send_keys(self.password)
            time.sleep(1)
            self.driver.find_element_by_xpath(
                '//button[@class="btn primaryBtn full-width btn-spacing mat-flat-button mat-button-base"]').click()

            while 1:
                time.sleep(15)
                print("CCCCCCCCCCCCCCCCCCCCCCCCC")
                x = requests.get('http://54.228.50.10/api/v1/login_sms_otp/')
                print("-----------------", x.json())

                self.driver.find_element_by_xpath('//input[@name="otp"]').send_keys("12345")
                time.sleep(2)
                verify_btn = self.driver.find_element_by_xpath(
                    '//button[@class="btn primaryBtn right m0 mat-flat-button mat-button-base"]')
                if verify_btn.is_enabled():
                    time.sleep(2)
                    verify_btn.click()
                    break

            self.isloggedin = True
            return True

        except Exception as e:
            self.error_msg = 'Login %s (%s)' % (e, type(e))

        self.isloggedin = False
        return False

    def get_register_page(self):
        try:
            if self.isloggedin:
                time.sleep(5)
                self.driver.get(RICA_REGISTER_URL)
                expected = EC.visibility_of_element_located(
                    (By.XPATH,
                     "/html/body/app-root/app-home/mat-sidenav-container/mat-sidenav-content/app-subscriber/mat-tab-group/div/mat-tab-body[1]/div/app-subscriber-editor/div/mat-card/mat-card-content/form/div[1]/div[1]/mat-form-field[1]/div/div[1]/div")
                )
                WebDriverWait(self.driver, 20).until(expected)
                return True
            elif self.isloggedin is None:
                if self.login():
                    time.sleep(5)
                    self.driver.get(RICA_REGISTER_URL)
                    expected = EC.visibility_of_element_located(
                        (By.XPATH,
                         "/html/body/app-root/app-home/mat-sidenav-container/mat-sidenav-content/app-subscriber/mat-tab-group/div/mat-tab-body[1]/div/app-subscriber-editor/div/mat-card/mat-card-content/form/div[1]/div[1]/mat-form-field[1]/div/div[1]/div")
                    )
                    WebDriverWait(self.driver, 20).until(expected)
                    return True
                else:
                    return False
            else:
                return False
        except Exception as e:
            self.error_msg = 'Reach reg page: %s (%s)' % (e, type(e))
            return False

    def open_tag_by_css(self, css_selector):
        self.driver.find_element_by_css_selector(css_selector).click()

    def open_tag_by_xpath(self, xpath):
        self.driver.find_element_by_xpath(xpath).click()

    def enter_in_tag_by_css(self, css_selector, text):
        self.driver.find_element_by_css_selector(css_selector).send_keys(text)

    def enter_in_tag_by_xpath(self, xpath, text):
        self.driver.find_element_by_xpath(xpath).send_keys(text)
        time.sleep(0.5)

    def fill_form(self, network, new_existing_subscriber, register_with, sim, last4, id_type, country, id_number,
                  full_name, surname, country_code, area_code, dailing_number, address1, address2, address3, suburb,
                  postal_code, city_or_town, proof_of_address):
        result = False

        try:
            # --- entering data ---
            if self.flag is True:
                self.driver.refresh()
                self.flag = False
                time.sleep(5)
            # Network
            element = self.driver.find_element_by_xpath(
                '/html/body/app-root/app-home/mat-sidenav-container/mat-sidenav-content/app-subscriber/mat-tab-group/div/mat-tab-body[1]/div/app-subscriber-editor/div/mat-card/mat-card-content/form/div[1]/div[1]/mat-form-field[1]/div/div[1]/div/mat-select/div/div[2]/div')
            self.driver.execute_script("arguments[0].click();", element)
            time.sleep(0.3)
            body = self.driver.find_element_by_tag_name('body')
            for i in range(5):
                body.send_keys(Keys.UP)
            if network.lower() in ('cellc', 'cell c'):
                body.send_keys(Keys.ENTER)
            if network.lower() == 'lyca':
                body.send_keys(Keys.DOWN)
                body.send_keys(Keys.ENTER)
            if network.lower() == 'mtn':
                body.send_keys(Keys.DOWN)
                body.send_keys(Keys.DOWN)
                body.send_keys(Keys.ENTER)
            if network.lower() == 'telcom':
                body.send_keys(Keys.DOWN)
                body.send_keys(Keys.DOWN)
                body.send_keys(Keys.DOWN)
                body.send_keys(Keys.ENTER)
            if network.lower() == 'virgin':
                body.send_keys(Keys.DOWN)
                body.send_keys(Keys.DOWN)
                body.send_keys(Keys.DOWN)
                body.send_keys(Keys.DOWN)
                body.send_keys(Keys.ENTER)
            if network.lower() == 'vodacom':
                body.send_keys(Keys.DOWN)
                body.send_keys(Keys.DOWN)
                body.send_keys(Keys.DOWN)
                body.send_keys(Keys.DOWN)
                body.send_keys(Keys.DOWN)
                body.send_keys(Keys.ENTER)

            time.sleep(process_sleep)

            # Existing/New
            element = self.driver.find_element_by_xpath(
                '/html/body/app-root/app-home/mat-sidenav-container/mat-sidenav-content/app-subscriber/mat-tab-group/div/mat-tab-body[1]/div/app-subscriber-editor/div/mat-card/mat-card-content/form/div[1]/div[1]/mat-form-field[2]/div/div[1]/div')
            self.driver.execute_script("arguments[0].click();", element)
            body.send_keys(Keys.UP)
            if new_existing_subscriber.lower() == 'new':
                body.send_keys(Keys.ENTER)
            if new_existing_subscriber.lower() == 'existing':
                body.send_keys(Keys.DOWN)
                body.send_keys(Keys.ENTER)
            time.sleep(process_sleep)

            # Register with (SIM / Starter Pack)
            element = self.driver.find_element_by_xpath(
                '/html/body/app-root/app-home/mat-sidenav-container/mat-sidenav-content/app-subscriber/mat-tab-group/div/mat-tab-body[1]/div/app-subscriber-editor/div/mat-card/mat-card-content/form/div[1]/div[1]/mat-form-field[3]/div/div[1]/div')
            self.driver.execute_script("arguments[0].click();", element)
            body.send_keys(Keys.UP)
            body.send_keys(Keys.UP)
            if register_with.lower() in ('cellphone number', 'cellphonenumber'):
                body.send_keys(Keys.ENTER)
            if register_with.lower() == 'sim':
                body.send_keys(Keys.DOWN)
                body.send_keys(Keys.ENTER)
            if register_with.lower() in ('starter pack', 'starterpack', 'starter'):
                body.send_keys(Keys.DOWN)
                body.send_keys(Keys.DOWN)
                body.send_keys(Keys.ENTER)
            time.sleep(process_sleep)

            # Cellphone / Serial Number / Starter Pack
            cellphone = self.driver.find_element_by_xpath(
                '/html/body/app-root/app-home/mat-sidenav-container/mat-sidenav-content/app-subscriber/mat-tab-group/div/mat-tab-body[1]/div/app-subscriber-editor/div/mat-card/mat-card-content/form/div[1]/div[2]/mat-form-field[1]/div/div[1]/div/input')
            cellphone.clear()
            cellphone.send_keys(sim)
            time.sleep(process_sleep)

            # ID type
            element = self.driver.find_element_by_xpath(
                '/html/body/app-root/app-home/mat-sidenav-container/mat-sidenav-content/app-subscriber/mat-tab-group/div/mat-tab-body[1]/div/app-subscriber-editor/div/mat-card/mat-card-content/form/div[1]/div[3]/mat-form-field[1]/div/div[1]/div')
            self.driver.execute_script("arguments[0].click();", element)
            body.send_keys(Keys.UP)
            body.send_keys(Keys.UP)
            if id_type.lower() in ('business registration', 'businessregistration', 'business'):
                body.send_keys(Keys.ENTER)
            if id_type.lower() == 'passport':
                body.send_keys(Keys.DOWN)
                body.send_keys(Keys.ENTER)
            if id_type.lower() == 'id':
                body.send_keys(Keys.DOWN)
                body.send_keys(Keys.DOWN)
                body.send_keys(Keys.ENTER)
            time.sleep(process_sleep)

            # Nationality
            element = self.driver.find_element_by_xpath("//input[@formcontrolname='countryOfIdentityDocument']")
            self.driver.execute_script("arguments[0].click();", element)
            element.clear()
            element.send_keys(country)
            time.sleep(0.3)
            body.send_keys(Keys.DOWN)
            body.send_keys(Keys.ENTER)
            time.sleep(process_sleep)

            # ID number
            self.driver.find_element_by_xpath('//input[@formcontrolname="identityNumber"]').clear()
            time.sleep(sleep_after_clear)
            self.enter_in_tag_by_xpath('//input[@formcontrolname="identityNumber"]', id_number)
            time.sleep(process_sleep)

            # Passport Expiry Date
            # element = self.driver.find_element_by_xpath('//input[@formcontrolname="selectedPassportExpiryDate"]')
            # self.driver.execute_script("arguments[0].click();", element)
            # element.send_keys(Keys.CONTROL + "a")
            # element.send_keys(Keys.DELETE)
            # time.sleep(sleep_after_clear)
            # self.enter_in_tag_by_xpath('//input[@formcontrolname="selectedPassportExpiryDate"]',
            #                            passport_expiry_date)
            # time.sleep(process_sleep)

            # Full Name
            self.driver.find_element_by_xpath('//input[@formcontrolname="fullName"]').clear()
            time.sleep(sleep_after_clear)
            self.enter_in_tag_by_xpath('//input[@formcontrolname="fullName"]', full_name)
            time.sleep(process_sleep)

            # Surname
            self.driver.find_element_by_xpath('//input[@formcontrolname="surname"]').clear()
            time.sleep(sleep_after_clear)
            self.enter_in_tag_by_xpath('//input[@formcontrolname="surname"]', surname)
            time.sleep(process_sleep)

            # Country Dialing Code
            self.driver.find_element_by_xpath('//input[@formcontrolname="countryDialingCode"]').clear()
            time.sleep(sleep_after_clear)
            self.enter_in_tag_by_xpath('//input[@formcontrolname="countryDialingCode"]', country_code)
            time.sleep(process_sleep)

            # Area Code
            self.driver.find_element_by_xpath('//input[@formcontrolname="areaDialingCode"]').clear()
            time.sleep(sleep_after_clear)
            self.enter_in_tag_by_xpath('//input[@formcontrolname="areaDialingCode"]', area_code)
            time.sleep(process_sleep)

            # Dialing Number
            self.driver.find_element_by_xpath('//input[@formcontrolname="dialingNumber"]').clear()
            time.sleep(sleep_after_clear)
            self.enter_in_tag_by_xpath('//input[@formcontrolname="dialingNumber"]', dailing_number)
            time.sleep(process_sleep)

            # Address line1
            self.driver.find_element_by_xpath('//input[@formcontrolname="addressLine1"]').clear()
            time.sleep(sleep_after_clear)
            self.enter_in_tag_by_xpath('//input[@formcontrolname="addressLine1"]', address1)
            time.sleep(process_sleep)

            # Address line2
            self.driver.find_element_by_xpath('//input[@formcontrolname="addressLine2"]').clear()
            time.sleep(sleep_after_clear)
            self.enter_in_tag_by_xpath('//input[@formcontrolname="addressLine2"]', address2)
            time.sleep(process_sleep)

            # Address line3
            self.driver.find_element_by_xpath('//input[@formcontrolname="addressLine3"]').clear()
            time.sleep(sleep_after_clear)
            self.enter_in_tag_by_xpath('//input[@formcontrolname="addressLine3"]', address3)
            time.sleep(process_sleep)

            # suburb
            self.driver.find_element_by_xpath('//input[@formcontrolname="suburb"]').clear()
            time.sleep(sleep_after_clear)
            self.enter_in_tag_by_xpath('//input[@formcontrolname="suburb"]', suburb)
            time.sleep(process_sleep)

            # Postal Code
            self.driver.find_element_by_xpath('//input[@formcontrolname="postalCode"]').clear()
            time.sleep(sleep_after_clear)
            self.enter_in_tag_by_xpath('//input[@formcontrolname="postalCode"]', postal_code)
            time.sleep(process_sleep)

            # City or Town
            self.driver.find_element_by_xpath('//input[@formcontrolname="cityOrTown"]').clear()
            time.sleep(sleep_after_clear)
            self.enter_in_tag_by_xpath('//input[@formcontrolname="cityOrTown"]', city_or_town)
            time.sleep(process_sleep)

            # country
            self.driver.find_element_by_xpath('//input[@formcontrolname="countryOfResidence"]').clear()
            time.sleep(sleep_after_clear)
            self.enter_in_tag_by_xpath('//input[@formcontrolname="countryOfResidence"]', country)
            self.driver.find_element_by_tag_name('body').send_keys(Keys.DOWN)
            self.driver.find_element_by_tag_name('body').send_keys(Keys.ENTER)
            time.sleep(process_sleep)

            # proof address
            if proof_of_address.lower() == 'yes':
                element = self.driver.find_element_by_xpath(
                    '/html/body/app-root/app-home/mat-sidenav-container/mat-sidenav-content/app-subscriber/mat-tab-group/div/mat-tab-body[1]/div/app-subscriber-editor/div/mat-card/mat-card-content/form/div[2]/mat-radio-group/mat-radio-button[1]/label/div[1]/div[1]'
                )
                self.driver.execute_script("arguments[0].click();", element)
            else:
                element = self.driver.find_element_by_xpath(
                    '/html/body/app-root/app-home/mat-sidenav-container/mat-sidenav-content/app-subscriber/mat-tab-group/div/mat-tab-body[1]/div/app-subscriber-editor/div/mat-card/mat-card-content/form/div[2]/mat-radio-group/mat-radio-button[2]/label/div[1]/div[1]'
                )
                self.driver.execute_script("arguments[0].click();", element)
            time.sleep(process_sleep)

            # click on Register
            element = self.driver.find_element_by_xpath(
                '/html/body/app-root/app-home/mat-sidenav-container/mat-sidenav-content/app-subscriber/mat-tab-group/div/mat-tab-body[1]/div/app-subscriber-editor/div/mat-card/mat-card-actions/button/span')
            self.driver.execute_script("arguments[0].click();", element)
            time.sleep(5)

            # receive response msg
            result = False

            while 1:
                try:
                    resp_msg = self.driver.find_element_by_id('message').text
                    logging.warning(resp_msg)
                    if len(resp_msg) != 0:
                        logging.warning(resp_msg)
                        result = True
                        break
                except Exception as e:
                    logging.warning(e)
                    time.sleep(8)
                    try:
                        resp_title = self.driver.find_element_by_id('title').text
                        logging.warning(resp_title)
                        if len(resp_title) != 0:
                            logging.warning(resp_title)
                            result = True
                            break
                    except Exception as error:
                        logging.warning(error)
                        break

            if result is True:
                print("Result is True")
            else:
                print("Result is False")
        except Exception as e:
            # print('Fill_form: %s (%s)' % (e, type(e)))
            # self.driver.save_screenshot('error %d.png' % jobstatus.id)
            print('Fill_form: %s (%s)' % (e, type(e)))

        return result
