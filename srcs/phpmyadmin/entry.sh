export EXTERNAL_IP=$(/tmp/get_external_ip_addresses.sh phpmyadmin)

envsubst '${MYSQL_SERVNAME} ${EXTERNAL_IP} ${MYSQL_USERNAME} ${MYSQL_PASSWORD}' < /tmp/config.inc.php > /var/www/html/config.inc.php

/usr/bin/supervisord -c /etc/supervisord.conf
