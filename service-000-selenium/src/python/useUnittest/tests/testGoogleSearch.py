#!/usr/bin/env python

import unittest

import time

from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from utils.driver import Driver
from utils.yaml import Yaml


class TestGoogleSearch(unittest.TestCase):
    browser = Driver()
    driver = None

    @classmethod
    def setUpClass(cls):
        cls.browser.start_driver()
        cls.driver = cls.browser.driver

    @classmethod
    def tearDownClass(cls):
        cls.browser.quit_driver()

    def test_one(self):
        data = Yaml(
            "/usr/src/service-000-selenium/src/python/useUnittest/data/google.yml"
        ).read()

        i_agree_button = data["elements"]["buttons"]["i_agree_button"]
        search_input = data["elements"]["inputs"]["search_input"]
        search_term = data["text"]["search_term"]

        # accept t&c
        self.current_selection = self.driver.find_element(
            By.XPATH,
            i_agree_button,
        ).click()

        # make a simple search
        self.current_selection = self.driver.find_element(
            By.XPATH,
            search_input,
        ).send_keys(search_term + Keys.ENTER)

        # perform test
        title_arr = self.driver.title.split("-")
        self.assertEqual(title_arr[0].strip(), search_term)

        # time.sleep(10)


if __name__ == "__main__":
    unittest.main(verbosity=2)
