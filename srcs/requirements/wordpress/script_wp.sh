#!/bin/sh
if [ ! -f $PROTECT_FILE ]
then
	sleep 15

	wp core download	--allow-root --path="/var/www/html/wordpress/"

	wp config create	--allow-root\
						--dbname="$DB_NAME"\
						--dbuser="$DB_USER"\
						--dbpass="$DB_PASSWORD"\
						--dbhost=mariadb:3306\
						--path="/var/www/html/wordpress/"

	wp core install		--allow-root\
						--admin_user="$ADMIN_USER"\
						--admin_password="$ADMIN_PASSWORD"\
						--admin_email="$ADMIN_USER"@example.com\
						--url=bsavinel.42.fr\
						--title="Inception"\
						--skip-email\
						--path="/var/www/html/wordpress/"

	wp user create		--allow-root\
						"$WP_USER"\
						"$WP_USER"@example.com\
						--role=author\
						--user_pass="$WP_USER_PASSWORD"\
						--path="/var/www/html/wordpress/"

	touch $PROTECT_FILE
else
	echo "wordpress is already installed an parametrized"
fi

exec php-fpm8 -F