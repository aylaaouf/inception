FROM debian:stable

RUN apt-get update && \
    apt-get install -y nginx openssl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY tools/setup_nginx.sh setup_nginx.sh

EXPOSE 443

RUN chmod +x setup_nginx.sh

ENTRYPOINT ["./tools/setup_nginx.sh"]