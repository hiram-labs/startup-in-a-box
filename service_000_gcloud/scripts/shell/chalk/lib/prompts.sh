#! /bin/sh

# set -x
# set -euo pipefail

function prompt_intro_msg () {
    echo -e "${GREEN}Thanks for using chalk CLI${RESET_COLOR}"
}

function prompt_missing_arg () {
    echo -e "${RED}Please provide an argument${RESET_COLOR}"
}