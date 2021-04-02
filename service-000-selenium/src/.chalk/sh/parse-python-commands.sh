#!/bin/sh

# set -x
# set -euo pipefail

if [ $# -gt 0 ] && [ -n "$PYTHON_ROOT" ]; then
    cd "$PYTHON_ROOT" || chalk error 102
fi

if [ "$1" = "init" ]; then
    pipenv check
    pipenv shell
    return 1
fi

if [ "$1" = "pretty" ]; then
    pipenv run black .
    return 1
fi

if [ "$1" = "isort" ]; then
    pipenv run isort .
    return 1
fi

if [ "$1" = "lint" ]; then
    pipenv run flake8 .
    return 1
fi

chalk error 103
