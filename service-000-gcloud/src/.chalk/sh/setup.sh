#!/bin/sh

# shellcheck disable=SC2240
# shellcheck disable=SC1090

# set -x
# set -euo pipefail

# catch no arguments errors
if [ $# -eq 0 ]; then
    chalk error 106
    return 1
fi

# controllers
if [ "$1" = 'controller' ] && [ "$2" = 'nginx' ]; then
    shift
    shift
    . "$SHELL_SCRIPTS"/k8s/controllers/nginx.sh "$@"
    return 1
fi

if [ "$1" = 'controller' ] && [ "$2" = 'cert-manager' ]; then
    shift
    shift
    . "$SHELL_SCRIPTS"/k8s/controllers/cert-manager.sh "$@"
    return 1
fi

# metrics
if [ "$1" = 'metric' ] && [ "$2" = 'prometheus' ]; then
    shift
    shift
    . "$SHELL_SCRIPTS"/k8s/metrics/prometheus.sh "$@"
    return 1
fi

# resources
if [ "$1" = 'resource' ] && [ "$2" = 'cluster-prod-issuer' ]; then
    shift
    shift
    . "$SHELL_SCRIPTS"/k8s/resources/cluster-prod-issuer.sh "$@"
    return 1
fi

if [ "$1" = 'resource' ] && [ "$2" = 'cluster-staging-issuer' ]; then
    shift
    shift
    . "$SHELL_SCRIPTS"/k8s/resources/cluster-staging-issuer.sh "$@"
    return 1
fi

if [ "$1" = 'resource' ] && [ "$2" = 'erpnext-ingress' ]; then
    shift
    shift
    . "$SHELL_SCRIPTS"/k8s/resources/erpnext-ingress.sh "$@"
    return 1
fi

if [ "$1" = 'resource' ] && [ "$2" = 'erpnext-sites-base' ]; then
    shift
    shift
    . "$SHELL_SCRIPTS"/k8s/resources/erpnext-sites-base.sh "$@"
    return 1
fi

if [ "$1" = 'resource' ] && [ "$2" = 'namespace-issuer' ]; then
    shift
    shift
    . "$SHELL_SCRIPTS"/k8s/resources/namespace-issuer.sh "$@"
    return 1
fi

# services
if [ "$1" = 'service' ] && [ "$2" = 'erpnext-db' ]; then
    shift
    shift
    . "$SHELL_SCRIPTS"/k8s/services/erpnext-db.sh "$@"
    return 1
fi

if [ "$1" = 'service' ] && [ "$2" = 'erpnext' ]; then
    shift
    shift
    . "$SHELL_SCRIPTS"/k8s/services/erpnext.sh "$@"
    return 1
fi

if [ "$1" = 'service' ] && [ "$2" = 'gitea' ]; then
    shift
    shift
    . "$SHELL_SCRIPTS"/k8s/services/gitea.sh "$@"
    return 1
fi

if [ "$1" = 'service' ] && [ "$2" = 'harbor' ]; then
    shift
    shift
    . "$SHELL_SCRIPTS"/k8s/services/harbor.sh "$@"
    return 1
fi

if [ "$1" = 'service' ] && [ "$2" = 'jenkins' ]; then
    shift
    shift
    . "$SHELL_SCRIPTS"/k8s/services/jenkins.sh "$@"
    return 1
fi

# volumes
if [ "$1" = 'volume' ] && [ "$2" = 'nfs' ]; then
    shift
    shift
    . "$SHELL_SCRIPTS"/k8s/volumes/nfs.sh "$@"
    return 1
fi

# catch invalid arguments errors
if [ -n "$1" ]; then
    chalk error 106
    return 1
fi
