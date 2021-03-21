#! /bin/sh

# set -x
# set -euo pipefail

# catch no arguments errors
if [[ $# -eq 0 ]]
    then
        prompt_missing_arg
        return 1
fi

# sets gcloud admin permissions and basic configs 
if [[ $1 = 'init' ]]
    then
        shift
        . $SCRIPTS/gcloud/init.sh "$@"
        return 1
fi

# create a cluster
if [[ $1 = 'cluster' ]]
    then
        shift
        . $SCRIPTS/gcloud/cluster.sh "$@"
        return 1
fi

# connect to a cluster and issue gcloud commands against it 
if [[ $1 = 'connect' ]]
    then
        shift
        . $SCRIPTS/gcloud/connect.sh "$@"
        return 1
fi

# provision staticIP
if [[ $1 = 'staticIP' ]]
    then
        . $SCRIPTS/gcloud/staticIP.sh "$@"
        return 1
fi