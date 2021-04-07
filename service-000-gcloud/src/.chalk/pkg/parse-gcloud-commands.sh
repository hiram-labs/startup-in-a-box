#!/bin/bash

# set -x
# set -euo pipefail

# catch no arguments errors
if [ $# -eq 0 ]; then
    chalk error 105
    exit 0
fi

# sets gcloud admin permissions and basic configs
if [ $1 = 'init' ]; then
    [ "$#" -ne 0 ] && shift
    . "$SHELL_SCRIPTS"/gcloud/init.sh "$@"
    exit 0
fi

# create a cluster
if [ $1 = 'cluster' ]; then
    [ "$#" -ne 0 ] && shift
    . "$SHELL_SCRIPTS"/gcloud/cluster.sh "$@"
    exit 0
fi

# connect to a cluster and issue gcloud commands against it
if [ $1 = 'connect' ]; then
    [ "$#" -ne 0 ] && shift
    . "$SHELL_SCRIPTS"/gcloud/connect.sh "$@"
    exit 0
fi

# provision static-ip
if [ $1 = 'static-ip' ]; then
    [ "$#" -ne 0 ] && shift
    . "$SHELL_SCRIPTS"/gcloud/static-ip.sh "$@"
    exit 0
fi

# catch invalid arguments errors
if [ -n $1 ]; then
    chalk error 105
    exit 0
fi
