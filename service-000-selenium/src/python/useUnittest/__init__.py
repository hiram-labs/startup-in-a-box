#!/usr/bin/env python

import unittest
import HtmlTestRunner


def suite():
    # TODO:
    # move paths to central location

    test_suite = unittest.TestLoader().discover("./useUnittest")
    # unittest.TextTestRunner().run(test_suite)

    runner = HtmlTestRunner.HTMLTestRunner(
        output="../caddy",
        combine_reports=True,
        report_name="unittest",
        add_timestamp=False,
    )
    runner.run(test_suite)


if __name__ == "__main__":
    suite()
