#!/usr/bin/env python

import unittest

from utils.driver import Driver


class TestTemplate(unittest.TestCase):
    browser = Driver()
    driver = None

    @classmethod
    def setUpClass(cls):
        cls.browser.start_driver()
        cls.driver = cls.browser.driver

    @classmethod
    def tearDownClass(cls):
        cls.browser.quit_driver()

    def test_template_one(self):
        self.assertTrue(self.driver.current_url)

    def test_template_two(self):
        self.assertTrue(self.driver.title)


if __name__ == "__main__":
    unittest.main(verbosity=2)
