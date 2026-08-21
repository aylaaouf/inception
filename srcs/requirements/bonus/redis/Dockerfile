FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y redis-server && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./conf/redis.conf /etc/redis/redis.conf
COPY ./tools/setup_redis.sh /usr/local/bin/setup_redis.sh

RUN chmod +x /usr/local/bin/setup_redis.sh

EXPOSE 6379

ENTRYPOINT ["/usr/local/bin/setup_redis.sh"]