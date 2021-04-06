#!/bin/bash

# set -x
# set -euo pipefail

style_prompt_message() {
    echo -e "$PROMPT_MESSAGE"
}

case $* in
101)
    PROMPT_MESSAGE="${BLUE}####################################################################\n${BLUE}### ${GREEN}              ✨ Thanks for using Chalk CLI ✨              ${BLUE} ###\n${BLUE}####################################################################${RESET_STYLE}"
    ;;
esac

style_prompt_message
