#!/bin/bash

if ! id ftpuser >/dev/null 2>&1; then
    useradd --home-dir /home/ftpuser --no-create-home ftpuser
fi

echo "ftpuser:${FTP_PASSWD}" | chpasswd

chown -R ftpuser:ftpuser /home/ftpuser

exec vsftpd /etc/vsftpd/ftp.conf