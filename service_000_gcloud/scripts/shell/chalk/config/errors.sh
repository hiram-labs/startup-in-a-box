#! /bin/sh

# set -x
# set -euo pipefail

# TODO:
# set up error hints for all commands

echo -e "${RED}error_config with args${RESET_COLOR}: $@"

# return 1 - normal return for break
# exit 1 - error and send to error script
# error 101 - unknown flag