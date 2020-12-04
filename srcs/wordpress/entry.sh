# Temporary - only to be used when testing container in isolation from kubernetes
# export MYSQL_USERNAME=mysql
# export MYSQL_PASSWORD=codam
# export MYSQL_DB=wordpress

export EXTERNAL_IP=$(/tmp/get_external_ip_addresses.sh wordpress)

# Install Wordpress CLI source: https://wp-cli.org/
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

chown www:www /user/local/bin/wp
chown -R nobody:www /www

addgroup nobody www
chmod -R g+rwx /www

su www -c /tmp/wpinstall.sh

chmod -R g+rwx /www/*

/usr/bin/supervisord -c /etc/supervisord.conf
