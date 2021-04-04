#!/usr/bin/env python

import os
import unittest

import HTMLTestRunner
from workingLinks import WorkingLinksTest


def suite():
    dir = os.getcwd()

    working_links = unittest.TestLoader().loadTestsFromTestCase(WorkingLinksTest)
    test_suite = unittest.TestSuite([working_links])

    outfile = open(dir + "unittestSummary.html", "w")
    runner = HTMLTestRunner.HTMLTestRunner(
        stream=outfile, title="Test Report", description="Acceptance Tests"
    )
    runner.run(test_suite)


if __name__ == "__main__":
    suite()