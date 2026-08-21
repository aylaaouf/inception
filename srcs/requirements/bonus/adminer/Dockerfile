FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y \
        php \
        php-mysqli \
        php-pdo \
        wget \
        ca-certificates && \
    rm -rf /var/lib/apt/lists/*

RUN rm -f /var/www/html/index.html && \
    wget -O /var/www/html/index.php \
    https://www.adminer.org/latest.php

COPY ./tools/run_adminer.sh /usr/local/bin/run_adminer.sh

RUN chmod +x /usr/local/bin/run_adminer.sh

EXPOSE 6060

ENTRYPOINT ["/usr/local/bin/run_adminer.sh"]