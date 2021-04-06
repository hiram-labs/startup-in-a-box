#!/bin/sh

# set -x
# set -euo pipefail

# shellcheck disable=SC2034

set -a
CHALK_STATUS=true

RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
PURPLE='\033[0;35m'
ORANGE='\033[0;33m'

DIM_FONT='\033[2m'
BOLD_FONT='\033[1m'
BLINK_FONT='\033[5m'
ITALICS_FONT='\033[3m'
UNDERLINE_FONT='\033[4m'

RESET_STYLE='\033[0m'

SH_PATH=/usr/src/selenium/src/.chalk/sh
set +a
