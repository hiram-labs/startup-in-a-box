#!/bin/bash

# set -x
# set -euo pipefail

# TODO:
# add clean up functionality
clean_up() {
    echo -e "\n${BLUE}cleaning up...${RESET_STYLE}"
    exit 0
}

wait_for_grid() {
    while ! curl -sSL "$SELENIUM_HUB_URL" 2>&1 |
        jq -r '.value.ready' 2>&1 | grep "true" >/dev/null; do
        chalk prompt 102
        sleep 3
    done
    chalk prompt 103
}

replace_all_instances_of_sting() {
    find . -type f -exec sed -i "s/{$1}/{$2}/g" {} \;
}
