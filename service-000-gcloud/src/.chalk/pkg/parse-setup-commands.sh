#!/bin/bash

# set -x
# set -euo pipefail

# catch no arguments errors
if [ $# -eq 0 ]; then
    chalk error 106
    exit 0
fi

# controllers
if [ "$1" = 'controller' ] && [ "$2" = 'nginx' ]; then
    [ "$#" -ne 0 ] && shift
    [ "$#" -ne 0 ] && shift
    . "$SHELL_SCRIPTS"/k8s/controllers/nginx.sh "$@"
    exit 0
fi

if [ "$1" = 'controller' ] && [ "$2" = 'cert-manager' ]; then
    [ "$#" -ne 0 ] && shift
    [ "$#" -ne 0 ] && shift
    . "$SHELL_SCRIPTS"/k8s/controllers/cert-manager.sh "$@"
    exit 0
fi

# metrics
if [ "$1" = 'metric' ] && [ "$2" = 'prometheus' ]; then
    [ "$#" -ne 0 ] && shift
    [ "$#" -ne 0 ] && shift
    . "$SHELL_SCRIPTS"/k8s/metrics/prometheus.sh "$@"
    exit 0
fi

# resources
if [ "$1" = 'resource' ] && [ "$2" = 'cluster-prod-issuer' ]; then
    [ "$#" -ne 0 ] && shift
    [ "$#" -ne 0 ] && shift
    . "$SHELL_SCRIPTS"/k8s/resources/cluster-prod-issuer.sh "$@"
    exit 0
fi

if [ "$1" = 'resource' ] && [ "$2" = 'cluster-staging-issuer' ]; then
    [ "$#" -ne 0 ] && shift
    [ "$#" -ne 0 ] && shift
    . "$SHELL_SCRIPTS"/k8s/resources/cluster-staging-issuer.sh "$@"
    exit 0
fi

if [ "$1" = 'resource' ] && [ "$2" = 'erpnext-ingress' ]; then
    [ "$#" -ne 0 ] && shift
    [ "$#" -ne 0 ] && shift
    . "$SHELL_SCRIPTS"/k8s/resources/erpnext-ingress.sh "$@"
    exit 0
fi

if [ "$1" = 'resource' ] && [ "$2" = 'erpnext-sites-base' ]; then
    [ "$#" -ne 0 ] && shift
    [ "$#" -ne 0 ] && shift
    . "$SHELL_SCRIPTS"/k8s/resources/erpnext-sites-base.sh "$@"
    exit 0
fi

if [ "$1" = 'resource' ] && [ "$2" = 'namespace-issuer' ]; then
    [ "$#" -ne 0 ] && shift
    [ "$#" -ne 0 ] && shift
    . "$SHELL_SCRIPTS"/k8s/resources/namespace-issuer.sh "$@"
    exit 0
fi

# services
if [ "$1" = 'service' ] && [ "$2" = 'erpnext-db' ]; then
    [ "$#" -ne 0 ] && shift
    [ "$#" -ne 0 ] && shift
    . "$SHELL_SCRIPTS"/k8s/services/erpnext-db.sh "$@"
    exit 0
fi

if [ "$1" = 'service' ] && [ "$2" = 'erpnext' ]; then
    [ "$#" -ne 0 ] && shift
    [ "$#" -ne 0 ] && shift
    . "$SHELL_SCRIPTS"/k8s/services/erpnext.sh "$@"
    exit 0
fi

if [ "$1" = 'service' ] && [ "$2" = 'gitea' ]; then
    [ "$#" -ne 0 ] && shift
    [ "$#" -ne 0 ] && shift
    . "$SHELL_SCRIPTS"/k8s/services/gitea.sh "$@"
    exit 0
fi

if [ "$1" = 'service' ] && [ "$2" = 'harbor' ]; then
    [ "$#" -ne 0 ] && shift
    [ "$#" -ne 0 ] && shift
    . "$SHELL_SCRIPTS"/k8s/services/harbor.sh "$@"
    exit 0
fi

if [ "$1" = 'service' ] && [ "$2" = 'jenkins' ]; then
    [ "$#" -ne 0 ] && shift
    [ "$#" -ne 0 ] && shift
    . "$SHELL_SCRIPTS"/k8s/services/jenkins.sh "$@"
    exit 0
fi

# volumes
if [ "$1" = 'volume' ] && [ "$2" = 'nfs' ]; then
    [ "$#" -ne 0 ] && shift
    [ "$#" -ne 0 ] && shift
    . "$SHELL_SCRIPTS"/k8s/volumes/nfs.sh "$@"
    exit 0
fi

# catch invalid arguments errors
if [ -n "$1" ]; then
    chalk error 106
    exit 0
fi
