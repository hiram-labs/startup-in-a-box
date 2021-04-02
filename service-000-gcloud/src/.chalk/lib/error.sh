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
    ERROR_MESSAGE="Missing / Invalid argument [ install | uninstall | upgrade ]"
    ;;
104)
    ERROR_MESSAGE="Missing namespace argument"
    ;;
105)
    ERROR_MESSAGE="Missing / Invalid argument [ cluster | connect | static-ip ]"
    ;;
106)
    ERROR_MESSAGE="Missing / Invalid argument [ metrics | volumes | services | resources | controllers ]"
    ;;
107)
    ERROR_MESSAGE="Missing / Invalid argument [ gcloud | cluster | install | uninstall | upgrade ]"
    ;;
esac

style_error_message
