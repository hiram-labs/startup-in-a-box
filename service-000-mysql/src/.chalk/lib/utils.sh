#!/bin/bash

# set -x
# set -euo pipefail

# TODO:
# add clean up functionality
clean_up() {
    echo -e "\n${BLUE}cleaning up...${RESET_STYLE}"
}

replace_all_instances_of_sting() {
    find . -type f -exec sed -i "s/{$1}/{$2}/g" {} \;
}

check_database_existence() {
    CHECK_DB_RESULT=$(mysqlshow --defaults-extra-file="$CREDENTIALS_FILE" "$1" | grep -v Wildcard | grep -o "$1")
    if [ "$CHECK_DB_RESULT" == "$1" ]; then
        return 0
    fi
    return 1
}
