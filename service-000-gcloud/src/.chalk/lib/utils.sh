#!/bin/bash

# set -x
# set -euo pipefail

# handles flags
parse_general_flags () {
    while [ $# -gt 0 ]
        do
        key="$1"
        
        case $key in
            -ip|--ingressIP)
            export INGRESS_IP="$2"
            [ "$#" -ne 0 ] && shift
            [ "$#" -ne 0 ] && shift
            ;;
            -ns|--namespace)
            export PROJECT_NAMESPACE="$2"
            [ "$#" -ne 0 ] && shift
            [ "$#" -ne 0 ] && shift
            ;;
            -pn|--projectName)
            export PROJECT_ID="$2"
            [ "$#" -ne 0 ] && shift
            [ "$#" -ne 0 ] && shift
            ;;
            -rg|--region)
            export PROJECT_REGION="$2"
            [ "$#" -ne 0 ] && shift
            [ "$#" -ne 0 ] && shift
            ;;
            -z|--zone)
            export PROJECT_ZONE="$2"
            [ "$#" -ne 0 ] && shift
            [ "$#" -ne 0 ] && shift
            ;;
            install|uninstall|upgrade)
            [ "$#" -ne 0 ] && shift
            ;;
            *)
            chalk error 101
            ;;
        esac
    done
}

inject_env_vars_yml () {
    TEMP_DESTINATION=$(echo "$1" | sed -e 's/.yml/-env-injected.yml/g')
    envsubst "$(printf '${%s} ' $(env | sed 's/=.*//'))" < "$1" > "$TEMP_DESTINATION" 
}

clean_up () {
    find / -name "*-env-injected.yml" -delete
}

# TODO:
# handle short and long time ags

progress_indicator () {
    echo -e "${BLUE}Please wait for 1 mins!${RESET_STYLE}" 
    sleep 1m
}
