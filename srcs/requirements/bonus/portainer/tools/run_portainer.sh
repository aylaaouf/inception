#!/bin/bash

htpasswd -bnBC 10 "" "$(cat /run/secrets/portainer_password.txt)" \
    | tr -d ':\n' > /tmp/portainer_password_hash

exec /opt/portainer/portainer \
    --data /data \
    --host unix:///var/run/docker.sock \
    --admin-password-file /tmp/portainer_password_hash