#!/bin/sh
if [ ! -f $PROTECT_FILE ]
then
	wp core download	--allow-root

	wp config create	--allow-root\
						--dbname=$DB_NAME\
						--dbuser=$DB_USER\
						--dbpass=$DB_PASSWORD\
						--dbhost="mariadb"\
						--path="/var/www/wordpress/"

	wp core install		--allow-root
						--admin_user=$ADMIN_USER\
						--admin_password=$ADMIN_PASSWORD\
						--admin_email=$ADMIN@example.com\
						--url=localhost\
						--title="Inception"\
						--skip-email

	touch $PROTECT_FILE
else
	echo "worpress is already installed an parametrized"
fi
# wp user create   surement utile pour metre mettre le nouvel use non admin