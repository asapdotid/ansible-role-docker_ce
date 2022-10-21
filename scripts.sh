#!/usr/bin/env bash

set -e

# USAGE:
#    ansible-playbook-wrapper  [other ansible-playbook arguments]
#
# ENVIRONMENT VARIABLES:
#
#    - __HOST_SERVER                   deploy host (server)
#    - __HOST_PRIVATE_KEY              deploy key (private)
#    - __HOST_PUBLIC_KEY               deploy key (public)

__HOST_SERVER=$1
__HOST_PRIVATE_KEY=$2
__HOST_PUBLIC_KEY=$3

[ -d ~/.ssh ] || mkdir -p ~/.ssh && chmod -R 0700 ~/.ssh

echo -e """\
\n\
Host *\n\
    StrictHostKeyChecking no\n\
    UserKnownHostsFile=/dev/null\n\
    LogLevel ERROR\n\
""" >>~/.ssh/config

# Optional deploy private_key
if [ ! -z "$__HOST_PRIVATE_KEY" ] && [ ! -f "~/.ssh/id_rsa" ]; then
    echo -n "${__HOST_PRIVATE_KEY}" | base64 -d >~/.ssh/id_rsa
    chmod 0600 ~/.ssh/id_rsa
fi

# Loadkey into ssh-agent if key exist
if [ -f "~/.ssh/id_rsa" ]; then
    eval $(ssh-agent -s)
    ssh-add ~/.ssh/id_rsa
fi

# Optional deploy key
if [ ! -z "$__HOST_PUBLIC_KEY" ] && [ ! -f "~/.ssh/id_rsa.pub" ]; then
    echo -n "${__HOST_PUBLIC_KEY}" | base64 -d >~/.ssh/id_rsa.pub
    chmod 0644 ~/.ssh/id_rsa.pub
fi

# Optional deploy known hosts
if [ ! -z "$__HOST_SERVER" ] && [ ! -f "~/.ssh/known_hosts" ]; then
    ssh-keyscan -H "${__HOST_SERVER}" >>~/.ssh/known_hosts
    chmod 0644 ~/.ssh/known_hosts
fi

exec "$@"
