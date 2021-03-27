#! /bin/sh

# set -x
# set -euo pipefail

# handles flags
parse_general_flags () {
    while [[ $# -gt 0 ]]
        do
        key="$1"
        
        case $key in
            -ip|--ingressIP)
            export INGRESS_IP="$2"
            shift
            shift
            ;;
            -ns|--namespace)
            export PROJECT_NAMESPACE="$2"
            shift
            shift
            ;;
            -pn|--projectName)
            export PROJECT_ID="$2"
            shift
            shift
            ;;
            -rg|--region)
            export PROJECT_REGION="$2"
            shift
            shift
            ;;
            -z|--zone)
            export PROJECT_ZONE="$2"
            shift
            shift
            ;;
            install|uninstall|upgrade)
            shift
            ;;
            *)
            chalk error 101
            exit 1
            ;;
        esac
    done
}

# TODO:
# handle short and long time ags

progress_indicator () {
    echo -e "${BLUE}Please wait for 1 mins!${RESET_COLOR}" 
    sleep 1m
}