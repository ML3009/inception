#!/bin/sh


mkdir -p /var/www/html

mkdir -p /var/run/vsftpd/empty

adduser $FTP_USER --disabled-password --gecos ""
echo "$FTP_USER:$FTP_PASSWORD" | /usr/sbin/chpasswd &> /dev/null
chown -R $FTP_USER:$FTP_USER /var/www/html
echo $FTP_USER | tee -a /etc/vsftpd.userlist &> /dev/null


/usr/sbin/vsftpd /etc/vsftpd.conf