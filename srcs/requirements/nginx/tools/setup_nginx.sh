#!/bin/bash

mkdir -p /etc/nginx/ssl

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/nginx/ssl/myserver.key \
  -out /etc/nginx/ssl/myserver.crt \
  -subj "/C=MA/ST=Casablanca/L=Casablanca/O=42/OU=1337/CN=aylaaouf.42.fr"

exec nginx -g "daemon off;"