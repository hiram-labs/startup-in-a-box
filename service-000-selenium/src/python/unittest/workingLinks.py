#!/usr/bin/env python

import unittest
from selenium import webdriver
from selenium.webdriver.common.by import By


class WorkingLinksTest(unittest.TestCase):
    @classmethod
    def setUp(cls):
        driver = webdriver.Remote(
            command_executor="http://selenium-hub:4444/wd/hub",
            desired_capabilities={"browserName": "chrome", "javascriptEnabled": True},
        )
        driver.get("https://www.python.org")

    def test_search_box(self):
        # check search box exists on Home page
        self.assertTrue(self.is_element_present(By.NAME, "q"))

    def test_language_settings(self):
        # check language options on Home page
        self.assertTrue(self.is_element_present(By.ID, "_eEe"))

    @classmethod
    def tearDown(cls):
        # close the browser window
        cls.driver.quit()


if __name__ == "__main__":
    unittest.main(verbosity=2)