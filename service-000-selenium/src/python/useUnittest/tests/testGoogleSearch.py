#!/usr/bin/env python

import time
import unittest

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

    def test_search_action(self):
        data = Yaml(
            "/usr/src/selenium/src/python/useUnittest/data/testGoogleSearch.yml"
        ).read()

        I_AGREE_BUTTON = data["elements"]["buttons"]["i_agree_button"]
        SEARCH_INPUT = data["elements"]["inputs"]["search_input"]
        SEARCH_TERM = data["text"]["search_term"]

        # accept t&c
        self.current_selection = self.driver.find_element(
            By.XPATH,
            I_AGREE_BUTTON,
        ).click()

        # make a simple search
        self.current_selection = self.driver.find_element(
            By.XPATH,
            SEARCH_INPUT,
        ).send_keys(SEARCH_TERM + Keys.ENTER)

        # perform test
        title_arr = self.driver.title.split("-")
        self.assertEqual(title_arr[0].strip(), SEARCH_TERM)

        time.sleep(10)


if __name__ == "__main__":
    unittest.main(verbosity=2)
