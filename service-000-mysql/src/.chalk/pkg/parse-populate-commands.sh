#!/bin/bash

# set -x
# set -euo pipefail

if [ -n "$1" ] || [ -n "$2" ]; then
    check_database_existence "$1"

    if [ "$?" -eq 0 ]; then
        mysql --defaults-extra-file="$CREDENTIALS_FILE" --verbose "$1" <"$2" && exit 0
    fi
fi

chalk error 102

# chalk populate dump_test $BACKUP_PATH/strapi.sql
# chalk populate dump_test /usr/src/mysql/src/dump/dump_test.sql
