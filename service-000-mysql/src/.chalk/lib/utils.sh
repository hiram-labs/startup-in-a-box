#!/bin/sh

# set -x
# set -euo pipefail

# TODO:
# add clean up functionality
tear_down() {
    echo -e "\n${BLUE}cleaning up...${RESET_STYLE}"
    return 1
}

replace_all_instances_of_sting() {
    find . -type f -exec sed -i "s/{$1}/{$2}/g" {} \;
}
