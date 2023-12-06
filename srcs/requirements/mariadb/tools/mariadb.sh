#!/bin/sh

SQL_DATABASE="data"
SQL_USER="usr"
SQL_PASSWORD="mdp"
SQL_ROOT_PASSWORD="mdp1"

service mariadb start

sleep 1

mysql -e "CREATE DATABASE IF NOT EXISTS ${SQL_DATABASE};"

mysql -e "CREATE USER IF NOT EXISTS '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

mysql -e "GRANT ALL PRIVILEGES ON ${SQL_DATABASE}.* TO '${SQL_USER}'@'%' IDENTIFIED BY '${SQL_PASSWORD}';"

mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"

mysql -e "FLUSH PRIVILEGES;"

sleep 1

mysqladmin -u root -p${SQL_ROOT_PASSWORD} shutdown

exec mysqld 