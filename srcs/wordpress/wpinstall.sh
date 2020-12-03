# Substitute environment variables in the config file
envsubst '${EXTERNAL_IP} ${WP_USER} ${WP_PASS} ${MYSQL_DB} ${MYSQL_SERVNAME}' < /tmp/wp-config.php > /var/www/html/wordpress/wp-config.php

wp core is-installed
if [ $? == 1 ]
then
	wp core download
	wp core install --url=$EXTERNAL_IP --path=/var/www/html/wordpress --title="rlucas Wordpress" --admin_user="$WP_USER" --admin_password="$WP_PASS" --admin_email="rlucas@student.codam.nl" --skip-email
	wp term create category Test
	export ID=$(wp user get "$WP_USER" --field=ID)
	wp post create --post_author=$ID --post_category="Test" --post_title="ft_services post" --post_content="This is the very first post in my ft_services wordpress container" --post_excerpt=tag --post_status=publish

	wp user create editor_user editor@example.com --role=editor --user_pass=editor
    wp user create author_user author@example.com --role=author --user_pass=author
    wp user create contibutor_user contributor@example.com --role=contributor --user_pass=contributor
    wp user create subscriber_user subscriber@example.com --role=subscriber --user_pass=subscriber

	export ID=$(wp user get "author_user" --field=ID)
	wp post create --post_author=$ID --post_category="Test" --post_title="Leeds best" --post_content="Leeds are the best. Go Leeds." --post_excerpt=tag --post_status=publish

	wp theme install go
	wp theme install twentyseventeen
	wp theme install twentytwenty
	wp theme activate go
fi

