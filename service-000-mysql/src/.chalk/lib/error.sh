#!/bin/bash

# set -x
# set -euo pipefail

ERROR_MESSAGE="unknown error!"

style_error_message() {
    echo -e "${RED}$ERROR_MESSAGE${RESET_STYLE}" >&2
}

case $* in
101)
    ERROR_MESSAGE="Missing / Invalid argument [ mysql client |  mysql populate | mysql backup | client | populate | backup ]"
    ;;
102)
    ERROR_MESSAGE="Missing / Invalid argument [ <database name> ] [ <file> ]"
    ;;
103)
    ERROR_MESSAGE="Missing / Invalid argument [ <database name> ] [ optional <dirname/filename.ext> ]"
    ;;
esac

style_error_message
