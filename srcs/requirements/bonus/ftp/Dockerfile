FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install vsftpd -y

COPY conf/vsftpd.conf /tmp/vsftpd.conf

COPY tools/user_ftp.sh /usr/local/bin/user_ftp.sh

RUN chmod +x /usr/local/bin/user_ftp.sh

CMD ["/usr/local/bin/user_ftp.sh"]