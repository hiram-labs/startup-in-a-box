#!/bin/sh

# set -x
# set -euo pipefail

if [ "$1" = "init" ]; then
    cd "$PYTHON_ROOT" &&
        pipenv shell
    return 1
fi
