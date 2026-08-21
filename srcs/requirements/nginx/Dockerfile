FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y nginx openssl gettext-base && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./conf/nginx.conf /etc/nginx/nginx.conf.template

COPY ./tools/setup_nginx.sh /usr/local/bin/setup_nginx.sh

EXPOSE 443

RUN chmod +x /usr/local/bin/setup_nginx.sh

ENTRYPOINT ["/usr/local/bin/setup_nginx.sh"]