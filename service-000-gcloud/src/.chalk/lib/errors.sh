#!/bin/sh

# set -x
# set -euo pipefail

ERROR_MESSAGE="unknown error!"

style_error_message() {
    echo -e "${RED}$ERROR_MESSAGE${RESET_STYLE}" >&2
}

case $* in
101)
    ERROR_MESSAGE="Unknown flag"
    ;;
102)
    ERROR_MESSAGE="Missing IP address as argument"
    ;;
103)
    ERROR_MESSAGE="Missing argument [ install | uninstall | upgrade ]"
    ;;
104)
    ERROR_MESSAGE="Missing namespace argument"
    ;;
105)
    ERROR_MESSAGE="Missing argument [ cluster | connect | static-ip ]"
    ;;
106)
    ERROR_MESSAGE="Missing argument [ metrics | volumes | services | resources | controllers ]"
    ;;
esac

style_error_message
