#! /bin/sh

# set -x
# set -euo pipefail

# catch no arguments errors
if [ $# -eq 0 ]
    then
        prompt_missing_arg
        return 1
fi

# sets gcloud admin permissions and basic configs 
if [ $1 = 'init' ]
    then
        shift
        . $SCRIPTS/gcloud/init.sh "$@"
        return 1
fi

# create a cluster
if [ $1 = 'cluster' ]
    then
        shift
        . $SCRIPTS/gcloud/cluster.sh "$@"
        return 1
fi

# connect to a cluster and issue gcloud commands against it 
if [ $1 = 'connect' ]
    then
        shift
        . $SCRIPTS/gcloud/connect.sh "$@"
        return 1
fi

# provision static-ip
if [ $1 = 'static-ip' ]
    then
        shift
        . $SCRIPTS/gcloud/static-ip.sh "$@"
        return 1
fi

# catch invalid arguments errors
if [ -n $1 ]
    then
        . $SCRIPTS/chalk/config/errors.sh "$@"
        exit 1
fi