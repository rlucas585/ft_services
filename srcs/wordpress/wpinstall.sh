# Substitute environment variables in the config file
envsubst '${EXTERNAL_IP} ${WP_USER} ${WP_PASS} ${MYSQL_DB} ${MYSQL_SERVNAME}' < /tmp/wp-config.php > /var/www/html/wordpress/wp-config.php

wp core is-installed
if [ $? == 1 ]
then
	wp core download
	wp core install --url=$EXTERNAL_IP --path=/var/www/html/wordpress --title="rlucas Wordpress" --admin_user="$WP_USER" --admin_password="$WP_PASS" --admin_email="rlucas@student.codam.nl" --skip-email

	# wp config create --dbname=$MYSQL_DB --dbuser=$MYSQL_USERNAME --prompt=dbpass # find a way to pass
	# the environment variable MYSQL_PASSWORD into the config create line here

	# At this point, a connection to mysql is required, even to run the wp core is-installed
	# line. I need to change the DB_HOST variable one way or another, possibly
	# by simply COPY of a desired wp-config.php file.

	# more stuff here to install wordpress and set up users, make a sample post
fi

