FROM debian:bookworm

RUN apt-get update && \
    apt-get install vsftpd -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY ./conf/ftp.conf /etc/vsftpd/ftp.conf
COPY ./tools/setup_ftp.sh /usr/local/bin/setup_ftp.sh

RUN chmod +x /usr/local/bin/setup_ftp.sh

EXPOSE 21 40000-40010

ENTRYPOINT ["/usr/local/bin/setup_ftp.sh"]