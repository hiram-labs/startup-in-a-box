#!/bin/bash

# set -x
# set -euo pipefail

if [ -n "$1" ]; then
    CURRENT_DATE=$(date +'%Y-%m-%d')
    check_database_existence "$1"

    if [ "$?" -eq 0 ]; then
        mysqldump --defaults-extra-file="$CREDENTIALS_FILE" \
            --verbose \
            --comments \
            --dump-date \
            --routines \
            --result-file="${2:-"$BACKUP_PATH/$CURRENT_DATE-$1.sql"}" \
            "${1:-$1}" &&
            exit 0
    fi
fi

chalk error 103

# chalk backup dump_test
