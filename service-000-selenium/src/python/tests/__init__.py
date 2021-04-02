#!/usr/bin/env python

from time import sleep

from selenium import webdriver
from selenium.webdriver.common.keys import Keys


def test():
    driver = webdriver.Remote(
        command_executor="http://selenium-hub:4444/wd/hub",
        desired_capabilities={"browserName": "chrome", "javascriptEnabled": True},
    )

    driver.get("https://www.python.org")
    print(driver.title)
    # driver.save_screenshot('screenshot.png')
    # search_bar = driver.find_element_by_name("q")
    # search_bar.clear()
    # search_bar.send_keys("getting started with python")
    # search_bar.send_keys(Keys.RETURN)
    # print(driver.current_url)
    # driver.close()
    # driver.quit()


if __name__ == "__main__":
    test()