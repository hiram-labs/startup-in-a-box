#! /bin/sh

# set -x
# set -euo pipefail

# TODO:
# set up error hints for all commands

echo -e "${RED}error_config with args${RESET_STYLE}: $*"

# return 1 - normal return for break
# exit 1 - error and send to error script

# find . -type f -exec sed -i 's/RESET_STYLE/RESET_STYLE/g' {} \;
