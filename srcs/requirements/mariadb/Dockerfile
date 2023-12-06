FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install mariadb-server -y

RUN mkdir -p var/run/mysqld && chown -R mysql:mysql /var/run/mysqld && chmod 755 /var/run/mysqld

COPY conf/mariadb.conf	/etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/mariadb.sh .

RUN chmod 755 ./mariadb.sh

EXPOSE 3306

CMD ["sh", "mariadb.sh"]