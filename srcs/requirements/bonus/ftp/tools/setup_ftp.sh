#!/bin/bash

mkdir -p /var/run/vsftpd/empty
chmod 755 /var/run/vsftpd/empty

if ! id ftpuser >/dev/null 2>&1; then
    useradd --home-dir /home/ftpuser --no-create-home ftpuser
fi

echo "ftpuser:${FTP_PASSWD}" | chpasswd

mkdir -p /home/ftpuser
chown -R ftpuser:ftpuser /home/ftpuser
chmod 755 /home/ftpuser

exec vsftpd /etc/vsftpd/ftp.conf
