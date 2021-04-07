#!/bin/bash

# set -x
# set -euo pipefail

ERROR_MESSAGE="unknown error!"

style_error_message() {
    echo -e "${RED}$ERROR_MESSAGE${RESET_STYLE}" >&2
}

case $* in
101)
    ERROR_MESSAGE="Missing argument [ selenium python | selenium javascript | python | javascript ]"
    ;;
102)
    ERROR_MESSAGE="Python file structure has been changed please revert back to original!"
    ;;
103)
    ERROR_MESSAGE="Missing argument [ init | pretty | isort | lint | unittest ]"
    ;;
esac

style_error_message
