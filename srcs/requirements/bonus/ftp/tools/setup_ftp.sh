#!/bin/bash

adduser --disabled-password --gecos "" ftpuser
echo "ftpuser:${FTP_PASSWD}" | chpasswd

exec vsftpd /etc/vsftpd/ftp.conf