#! /bin/sh

# set -x
# set -euo pipefail

# catch no arguments errors
if [[ $# -eq 0 ]]
    then
        prompt_missing_arg
        return 1
fi

if [[ $1 = 'controller' ]] && [[ $2 = 'nginx' ]]
    then
        shift
        shift
        . $SCRIPTS/k8s/controllers/nginx.sh "$@"
        return 1
fi

if [[ $1 = 'db' ]] && [[ $2 = 'mariadb' ]]
    then
        shift
        shift
        . $SCRIPTS/k8s/db/mariadb.sh "$@"
        return 1
fi

if [[ $1 = 'service' ]] && [[ $2 = 'erpnext' ]]
    then
        shift
        shift
        . $SCRIPTS/k8s/services/erpnext.sh "$@"
        return 1
fi

if [[ $1 = 'service' ]] && [[ $2 = 'gitea' ]]
    then
        shift
        shift
        . $SCRIPTS/k8s/services/gitea.sh "$@"
        return 1
fi

if [[ $1 = 'service' ]] && [[ $2 = 'jenkins' ]]
    then
        shift
        shift
        . $SCRIPTS/k8s/services/jenkins.sh "$@"
        return 1
fi

if [[ $1 = 'volume' ]] && [[ $2 = 'jenkins' ]]
    then
        shift
        shift
        . $SCRIPTS/k8s/volumes/jenkins.sh "$@"
        return 1
fi

if [[ -n $1 ]]
    then
        . $SCRIPTS/chalk/config/errors.sh "$@"
        return 1
fi