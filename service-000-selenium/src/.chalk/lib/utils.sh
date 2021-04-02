#! /bin/sh

# set -x
# set -euo pipefail

# TODO:
# add clean up functionality
tear_down() {
    echo cleaning up...
    return 1
}

wait_for_grid() {
    while ! curl -sSL "$SELENIUM_HUB_URL" 2>&1 |
        jq -r '.value.ready' 2>&1 | grep "true" >/dev/null; do
        prompt_selenium_hub_not_ready >&2
        sleep 3
    done
    prompt_selenium_hub_ready
}

replace_all_instances_of_sting() {
    find . -type f -exec sed -i "s/{$1}/{$2}/g" {} \;
}
