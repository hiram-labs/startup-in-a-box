#!/bin/sh

# set -x
# set -euo pipefail

# shellcheck disable=SC2240
# shellcheck disable=SC1090

# catch no arguments errors
if [ $# -eq 0 ]; then
    chalk error 105
    return 1
fi

# sets gcloud admin permissions and basic configs
if [ $1 = 'init' ]; then
    shift
    . "$SHELL_SCRIPTS"/gcloud/init.sh "$@"
    return 1
fi

# create a cluster
if [ $1 = 'cluster' ]; then
    shift
    . "$SHELL_SCRIPTS"/gcloud/cluster.sh "$@"
    return 1
fi

# connect to a cluster and issue gcloud commands against it
if [ $1 = 'connect' ]; then
    shift
    . "$SHELL_SCRIPTS"/gcloud/connect.sh "$@"
    return 1
fi

# provision static-ip
if [ $1 = 'static-ip' ]; then
    shift
    . "$SHELL_SCRIPTS"/gcloud/static-ip.sh "$@"
    return 1
fi

# catch invalid arguments errors
if [ -n $1 ]; then
    chalk error 105
    return 1
fi
