#!/usr/bin/env python

import unittest
from HtmlTestRunner import HTMLTestRunner


def suite():
    # TODO:
    # move path to central location
    test_suite = unittest.TestLoader().discover("./useUnittest")
    unittest.TextTestRunner().run(test_suite)

    runner = HTMLTestRunner(output="example_suite")
    runner.run(test_suite)


if __name__ == "__main__":
    suite()
