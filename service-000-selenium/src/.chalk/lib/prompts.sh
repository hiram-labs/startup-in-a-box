#! /bin/sh

# set -x
# set -euo pipefail

prompt_intro_msg() {
    echo -e "${BLUE}####################################################################\n${BLUE}### ${GREEN}              ✨ Thanks for using chalk CLI ✨              ${BLUE} ###\n${BLUE}####################################################################${RESET_STYLE}"
}

prompt_missing_arg() {
    echo -e "${RED}Please provide an argument!${RESET_STYLE}"
}

prompt_selenium_hub_not_ready() {
    echo -e "${YELLOW}⌛ Waiting for the Grid!${RESET_STYLE}"
}

prompt_selenium_hub_ready() {
    echo -e "${GREEN}🚀 Selenium Grid is up!${RESET_STYLE}"
}
