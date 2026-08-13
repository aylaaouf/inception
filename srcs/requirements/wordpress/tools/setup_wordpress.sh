#!/bin/bash

curl -O https://wordpress.org/latest.tar.gz &&
tar -xzf latest.tar.gz &&
cp -a wordpress/. /var/www/html &&
rm -rf wordpress latest.tar.gz

cd /var/www/html

until mariadb-admin ping \
    -h mariadb \
    -u"${MYSQL_USER}" \
    -p"${MYSQL_PASSWORD}" \
    --silent
do
    sleep 1
done

if [ ! -f wp-config.php ]; then
    wp config create \
        --dbname="${MYSQL_DATABASE}" \
        --dbuser="${MYSQL_USER}" \
        --dbpass="${MYSQL_PASSWORD}" \
        --dbhost="mariadb:3306" \
        --allow-root
fi

if ! wp core is-installed --allow-root; then
    wp core install \
        --url="https://aylaaouf.42.fr" \
        --title="Inception" \
        --admin_user="${WP_ADMIN_USER}" \
        --admin_password="${WP_ADMIN_PASSWORD}" \
        --admin_email="${WP_ADMIN_EMAIL}" \
        --allow-root

    wp user create "${WP_USER}" "${WP_USER_EMAIL}" \
        --role=subscriber \
        --user_pass="${WP_USER_PASSWORD}" \
        --allow-root
fi

exec php-fpm8.4 -F