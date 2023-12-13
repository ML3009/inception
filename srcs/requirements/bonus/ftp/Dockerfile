FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install vsftpd -y

COPY conf/vsftpd.conf /etc/vsftpd.conf

RUN chmod 600 /etc/vsftpd/vsftpd.conf