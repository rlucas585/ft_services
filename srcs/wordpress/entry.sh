# Temporary - only to be used when testing container in isolation from kubernetes
# export MYSQL_USERNAME=mysql
# export MYSQL_PASSWORD=codam
# export MYSQL_DB=wordpress

export EXTERNAL_IP=$(/tmp/get_external_ip_addresses.sh wordpress)
echo external ip is $EXTERNAL_IP

# Install Wordpress CLI source: https://wp-cli.org/
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

su rlucas -c /tmp/wpinstall.sh

/usr/bin/supervisord -c /etc/supervisord.conf
