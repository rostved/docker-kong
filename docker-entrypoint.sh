#!/usr/local/bin/dumb-init /bin/bash
set -e

# Disabling nginx daemon mode
export KONG_NGINX_DAEMON="off"

[ -z "$KONG_NGINX_DAEMON" ] && export KONG_NGINX_DAEMON="off"

# Set cluster listen address using IP from Rancher metadata
export KONG_CLUSTER_LISTEN="$(curl --retry 3 --fail --silent http://rancher-metadata/2015-07-25/self/container/primary_ip):7946"

exec "$@"

