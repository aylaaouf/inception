FROM debian:stable

RUN apt-get update && \
    apt-get install -y nginx openssl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

COPY ./tools/setup_nginx.sh /usr/local/bin/setup_nginx.sh

EXPOSE 443

RUN chmod +x /usr/local/bin/setup_nginx.sh

ENTRYPOINT ["/usr/local/bin/setup_nginx.sh"]