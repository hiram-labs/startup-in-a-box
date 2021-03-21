# #! /bin/sh

# # set -x
# # set -euo pipefail

# . connect.sh management

# helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
# helm repo update
# helm install nginx \
#     -f $HELM_VALUES/nginx.yml \
#     --atomic \
#     --create-namespace \
#     --namespace nginx \
#     ingress-nginx/ingress-nginx



# echo -e "${BLUE}Please wait for 3 mins!${RESET_COLOR}" 
# sleep 3m

echo nginx