FROM debian:stable

RUN apt-get update && \
    apt-get install -y \
        curl \
        ca-certificates \
        tar && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt

RUN curl -fL \
    https://github.com/portainer/portainer/releases/download/2.39.5/portainer-2.39.5-linux-amd64.tar.gz \
    -o portainer.tar.gz && \
    tar -xzf portainer.tar.gz && \
    rm portainer.tar.gz

COPY ./tools/run_portainer.sh /usr/local/bin/run_portainer.sh

RUN chmod +x /usr/local/bin/run_portainer.sh

EXPOSE 9443

ENTRYPOINT ["/usr/local/bin/run_portainer.sh"]