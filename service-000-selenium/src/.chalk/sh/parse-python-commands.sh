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
    [ "$2" = "--fix" ] && pipenv run autopep8 --in-place --aggressive --recursive .
    pipenv run flake8 .
    return 1
fi

if [ "$1" = "unittest" ]; then
    pipenv run python "$PYTHON_UNITTEST"/__init__.py
    return 1
fi

chalk error 103
