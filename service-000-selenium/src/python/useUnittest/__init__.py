#!/usr/bin/env python

import unittest


def suite():
    # TODO:
    # move path to central location
    test_suite = unittest.TestLoader().discover("./useUnittest")
    # test_results = unittest.TestResult()
    unittest.TextTestRunner().run(test_suite)


if __name__ == "__main__":
    suite()
