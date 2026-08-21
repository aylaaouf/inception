#!/bin/bash

mkdir -p /etc/nginx/ssl

envsubst '${DOMAIN_NAME}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/nginx/ssl/private.key \
  -out /etc/nginx/ssl/public.crt \
  -subj "/C=MA/ST=Casablanca/L=Casablanca/O=42/OU=1337/CN=${DOMAIN_NAME}"

exec nginx -g "daemon off;"