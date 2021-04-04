#!/usr/bin/env python

from selenium.webdriver import Remote


class Driver:
    def __init__(
        self,
        targetUrl="http://google.com",
        hubUrl="http://selenium-hub:4444/wd/hub",
        browser="chrome",
    ):
        self.targetUrl = targetUrl
        self.hubUrl = hubUrl
        self.browser = browser
        self.driver = None

    def start_driver(self):
        self.driver = Remote(
            command_executor=self.hubUrl,
            desired_capabilities={
                "browserName": self.browser,
                "javascriptEnabled": True,
            },
        )
        # self.driver.get(self.targetUrl)
        # self.driver.quit()

    def quit_driver(self):
        if self.driver is not None:
            self.driver.quit()


if __name__ == "__main__":
    Driver()