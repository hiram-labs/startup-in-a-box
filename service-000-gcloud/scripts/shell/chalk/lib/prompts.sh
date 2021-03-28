#! /bin/sh

# set -x
# set -euo pipefail

prompt_intro_msg () {
    echo -e "
    ${BLUE}##################################
    ${BLUE}### ${GREEN}Thanks for using chalk CLI${BLUE} ###
    ${BLUE}##################################${RESET_COLOR}
    "
    # echo -e "${GREEN}Thanks for using chalk CLI${RESET_COLOR}"
}

prompt_missing_arg () {
    echo -e "${RED}Please provide an argument${RESET_COLOR}"
}