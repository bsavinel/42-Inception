#!/bin/sh
if [ ! -f $PROTECT_FILE ]
then
	sleep 10

	echo "wordpress dowloads"
	wp core download	--allow-root --path="/var/www/wordpress/"

	echo "wordpress configures creates"
	wp config create	--allow-root\
						--dbname=$DB_NAME\
						--dbuser=$DB_USER\
						--dbpass=$DB_PASSWORD\
						--dbhost=mariadb:3306\
						--path="/var/www/wordpress/"

	echo "wordpress installs"
	wp core install		--allow-root\
						--admin_user=$ADMIN_USER\
						--admin_password=$ADMIN_PASSWORD\
						--admin_email=$ADMIN@example.com\
						--url=localhost\
						--title="Inception"\
						--skip-email\
						--path="/var/www/wordpress/"

	# wp user create   surement utile pour metre mettre le nouvel use non admin

	touch $PROTECT_FILE
else
	echo "worpress is already installed an parametrized"
fi
