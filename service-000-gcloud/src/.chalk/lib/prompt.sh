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
    PROMPT_MESSAGE="${YELLOW}😟 Please provide an argument${RESET_STYLE}"
    ;;
esac

style_prompt_message
# find ./ -type f -exec sed -i '' -e "s/RESET_STYLE/RESET_STYLE/g" {} \;
