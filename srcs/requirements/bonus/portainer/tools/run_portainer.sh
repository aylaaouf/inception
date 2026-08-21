#!/bin/bash

exec /opt/portainer/portainer \
    --data /data \
    --host unix:///var/run/docker.sock \
    --admin-password-file /run/secrets/portainer_password