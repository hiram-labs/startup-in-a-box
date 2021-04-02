#!/bin/sh

# set -x
# set -euo pipefail

chalk prompt 101 () {
    echo -e "
    ${BLUE}##################################
    ${BLUE}### ${GREEN}Thanks for using chalk CLI${BLUE} ###
    ${BLUE}##################################${RESET_COLOR}
    "
    # echo -e "${GREEN}Thanks for using chalk CLI${RESET_COLOR}"
}

chalk prompt 102 () {
    echo -e "${RED}Please provide an argument${RESET_COLOR}"
}
