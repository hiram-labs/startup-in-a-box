#! /usr/bin/env python3

from selenium import webdriver
from selenium.webdriver.common.keys import Keys

firefox_options = webdriver.FirefoxOptions()
driver = webdriver.Remote(
    command_executor='http://172.18.0.6:5555',
    options=firefox_options
)

driver.get("https://www.python.org")
print(driver.title)
# search_bar = driver.find_element_by_name("q")
# search_bar.clear()
# search_bar.send_keys("getting started with python")
# search_bar.send_keys(Keys.RETURN)
# print(driver.current_url)
# driver.close()