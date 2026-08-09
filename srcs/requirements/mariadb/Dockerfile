FROM debian:stable

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

    
COPY ./tools/setup_mariadb.sh /usr/local/bin/setup_mariadb.sh
COPY ./conf/server.cnf /etc/mysql/mariadb.conf.d/

RUN chmod +x /usr/local/bin/setup_mariadb.sh

EXPOSE 3306
    
ENTRYPOINT ["/usr/local/bin/setup_mariadb.sh"]