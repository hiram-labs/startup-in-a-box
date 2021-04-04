#!/usr/bin/env python

import unittest
from utils.driver import Driver


class TestNavLinks(unittest.TestCase):
    driver = Driver()

    @classmethod
    def setUpClass(cls):
        cls.driver.start_driver()

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit_driver()

    def test_one(self):
        pass

    def test_two(self):
        pass

    def test_three(self):
        pass


if __name__ == "__main__":
    unittest.main(verbosity=2)