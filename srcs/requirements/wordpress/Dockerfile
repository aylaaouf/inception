FROM debian:stable

RUN apt-get update && \
    apt-get install -y \
        php \
        php-fpm \
        php-mysql \
        php-curl \
        php-gd \
        php-xml \
        php-mbstring \
        php-zip \
        curl \
        mariadb-client \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/setup_wordpress.sh /usr/local/bin/setup_wordpress.sh

RUN chmod +x /usr/local/bin/setup_wordpress.sh

EXPOSE 9000

RUN sed -i 's|^listen = .*|listen = 0.0.0.0:9000|' /etc/php/8.4/fpm/pool.d/www.conf

ENTRYPOINT ["/usr/local/bin/setup_wordpress.sh"]