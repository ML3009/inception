FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt-get -y install wget

RUN apt-get install -y php 8.1\
						php-fpm\
						php-mysql\
						mariadb-client