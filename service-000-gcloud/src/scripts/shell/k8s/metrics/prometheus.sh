#!/bin/sh

# set -x
# set -euo pipefail

eval LAST_ARG=\"\$\{$#\}\"

VALUES_ENV_INJECTED="$HELM_VALUES"/prometheus-env-injected.yml
inject_env_vars_yml "$HELM_VALUES"/prometheus.yml

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

if [ "$LAST_ARG" =  "uninstall" ]
    then
        helm uninstall prometheus -n prometheus \
        kubectl delete crd alertmanagerconfigs.monitoring.coreos.com
        kubectl delete crd alertmanagers.monitoring.coreos.com
        kubectl delete crd podmonitors.monitoring.coreos.com
        kubectl delete crd probes.monitoring.coreos.com
        kubectl delete crd prometheuses.monitoring.coreos.com
        kubectl delete crd prometheusrules.monitoring.coreos.com
        kubectl delete crd servicemonitors.monitoring.coreos.com
        kubectl delete crd thanosrulers.monitoring.coreos.com
        return 1
fi

if [ "$LAST_ARG" =  "upgrade" ]
    then
        helm upgrade prometheus \
            -f "$VALUES_ENV_INJECTED" \
            --atomic \
            --version 14.4.0 \
            --namespace prometheus \
            prometheus-community/kube-prometheus-stack
        return 1
fi

if [ "$LAST_ARG" =  "install" ]
    then
        helm install prometheus \
            -f "$VALUES_ENV_INJECTED" \
            --atomic \
            --version 14.4.0 \
            --create-namespace \
            --namespace prometheus \
            prometheus-community/kube-prometheus-stack \
            && progress_indicator long \
            && echo -e "${BLUE}Grafana username:${RESET_COLOR} admin"\
            && echo -e "${BLUE}Grafana password:${RESET_COLOR} prom-operator"
        return 1
fi
