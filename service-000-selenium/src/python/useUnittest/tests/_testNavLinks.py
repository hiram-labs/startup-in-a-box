#!/usr/bin/env python

import unittest
from utils.initDriver import InitDriver


class TestNavLinks(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        driver = InitDriver()

    def test_one(self):
        pass

    def test_two(self):
        pass

    @classmethod
    def tearDownClass(cls):
        cls.driver.quit()


if __name__ == "__main__":
    unittest.main(verbosity=2)