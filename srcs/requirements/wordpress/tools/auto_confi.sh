sleep 10

if [ ! -f "/var/www/html/wp-config.php"]
    
then
    # download the wordpress core
    wp core download --allow-root




fi

exec /usr/sbin/php-fpm7.4 -F
