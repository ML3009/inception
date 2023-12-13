FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install nodejs -y && mkdir -p /var/www/html

RUN mkdir -p /etc/node/ssl

RUN apt install -y openssl

RUN openssl req -x509 -nodes -out /etc/node/ssl/inception.crt \
                             -keyout /etc/node/ssl/inception.key \
                             -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=mvautrot.42.fr/UID=mvautrot"

COPY conf/site.html /var/www/html/site.html

COPY tools/server.js /tmp/server.js

EXPOSE 1111

CMD ["node", "/tmp/server.js"]