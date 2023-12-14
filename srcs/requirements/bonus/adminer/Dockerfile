FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y lsb-release apt-transport-https ca-certificates curl wget

RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg

RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list

RUN apt update && apt install -y php8.1 php8.1-mysql

COPY ./tools/adminer.sh /adminer.sh

EXPOSE 9000

RUN chmod +x /adminer.sh 

RUN /adminer.sh

CMD ["php", "-S", "0.0.0.0:80"]