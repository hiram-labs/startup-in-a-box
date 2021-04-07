#!/bin/bash

# set -x
# set -euo pipefail

if [ $# -gt 0 ] && [ -n "$PYTHON_ROOT" ]; then
    cd "$PYTHON_ROOT" || chalk error 102
fi

if [ "$1" = "init" ]; then
    pipenv check
    pipenv shell
    exit 0
fi

if [ "$1" = "pretty" ]; then
    pipenv run black .
    exit 0
fi

if [ "$1" = "isort" ]; then
    pipenv run isort .
    exit 0
fi

if [ "$1" = "lint" ]; then
    [ "$2" = "--fix" ] && pipenv run autopep8 --in-place --aggressive --recursive .
    pipenv run flake8 .
    exit 0
fi

if [ "$1" = "unittest" ]; then
    pipenv run python "$PYTHON_UNITTEST"/__init__.py
    exit 0
fi

chalk error 103
