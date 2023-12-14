#!/bin/sh

#set up an envfor Adminer

#create repo struct
mkdir -p /var/www/html/adminer

#share last version of Adminer then save them on the repo
wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer/adminer.php

#permission attribute to Adminer file
chown -R www-data:www-data /var/www/html/adminer/adminer.php
chmod 755 /var/www/html/adminer/adminer.php

#change work repo
cd /var/www/html/inception/adminer

#delete file 
rm index.html

#create index.php then modify perm
touch index.php
chown -R index.php
chmod 755 index.php

#Add content in the file "index.php"

echo "
<?php
header(\"Location: http://mvautrot.42.fr/adminer/adminer.php\", true, 301);
exit();
?>" | tee -a index.php

