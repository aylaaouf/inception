FROM debian:bookworm

RUN apt-get update && \
    apt-get install python3 -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./tools/run_server.sh /usr/local/bin/run_server.sh

RUN chmod +x /usr/local/bin/run_server.sh
RUN mkdir -p /usr/local/bin/var/www/html

COPY resume_showcase.html /usr/local/bin/var/www/html/index.html

EXPOSE 80

ENTRYPOINT ["/usr/local/bin/run_server.sh"]