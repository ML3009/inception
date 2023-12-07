#!/bin/sh

#SQL_DATABASE="data"
#SQL_USER="usr"
#SQL_PASSWORD="mdp"
#SQL_HOST="host"
#WP_URL="test" 
#WP_TITLE="testTitle" 
#WP_ADMIN="ml" 
#WP_ADMIN_PASSWORD="123" 
#WP_ADMIN_EMAIL="ml@gmail.com" 
#WP_USER="lm" 
#WP_USER_EMAIL="lm@gmail.com" 
#WP_USER_PASSWORD="321"

sleep 10

if [ -f "/var/www/html/wp-config.php" ]; then
    echo "wordpress is already installed and configured\n"
else
    wp core download --allow-root

    wp core config --dbname=$SQL_DATABASE \
                   --dbuser=$SQL_USER \
                   --dbpass=$SQL_PASSWORD \
                   --dbhost=$SQL_HOST \
                   --allow-root

    wp core install --url=$WP_URL \
                    --title=$WP_TITLE \
                    --admin_user=$WP_ADMIN \
                    --admin_password=$WP_ADMIN_PASSWORD \
                    --admin_email=$WP_ADMIN_EMAIL \
                    --allow-root

    wp user create $WP_USER $WP_USER_EMAIL --role=author \
                    --user_pass=$WP_USER_PASSWORD \
                    --allow-root


fi

exec /usr/sbin/php-fpm7.4 -F
