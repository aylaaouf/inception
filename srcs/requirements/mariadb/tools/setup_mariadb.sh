#!/bin/bash

if [[ ! -d "/var/lib/mysql/mysql" ]]; then
    echo "Initializing MariaDB..."
    mariadb-install-db --user=mysql --datadir=/var/lib/mysql
    mariadb_auth=""
else
    echo "MariaDB already initialized"
    mariadb_auth="-uroot -p${MYSQL_ROOT_PASSWORD}"
fi

mysqld_safe --datadir=/var/lib/mysql &

until mariadb-admin ping --silent; do
    sleep 1
done

mariadb ${mariadb_auth} << EOF
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
ALTER USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF

mariadb-admin -uroot -p"${MYSQL_ROOT_PASSWORD}" shutdown

exec mysqld_safe --datadir=/var/lib/mysql