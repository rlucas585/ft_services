# Substitute environment variables in the config file
envsubst < /tmp/wp-config.php > /var/www/html/wordpress/wp-config.php

# Install Wordpress CLI source: https://wp-cli.org/
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
su rlucas
wp core is-installed
if [ $? == 1 ]
then
	wp core download
	# more stuff here to install wordpress and set up users, make a sample post
fi

/usr/bin/supervisord -c /etc/supervisord.conf
