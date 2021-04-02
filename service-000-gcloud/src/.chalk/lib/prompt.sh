#! /bin/sh

# set -x
# set -euo pipefail

prompt_intro_msg() {
    echo -e "
    ${BLUE}##################################
    ${BLUE}### ${GREEN}Thanks for using chalk CLI${BLUE} ###
    ${BLUE}##################################${RESET_COLOR}
    "
    # echo -e "${GREEN}Thanks for using chalk CLI${RESET_COLOR}"
}

prompt_missing_arg() {
    echo -e "${RED}Please provide an argument${RESET_COLOR}"
}

#!/bin/sh

# set -x
# set -euo pipefail

style_prompt_message() {
    echo -e "$PROMPT_MESSAGE"
}

case $* in
101)
    PROMPT_MESSAGE="${BLUE}####################################################################\n${BLUE}### ${GREEN}              ✨ Thanks for using chalk CLI ✨              ${BLUE} ###\n${BLUE}####################################################################${RESET_STYLE}"
    ;;
102)
    PROMPT_MESSAGE="${YELLOW}⌛ Waiting for the Grid!${RESET_STYLE}"
    ;;
103)
    PROMPT_MESSAGE="${GREEN}🚀 Selenium Grid is up!${RESET_STYLE}"
    ;;
esac

style_prompt_message
