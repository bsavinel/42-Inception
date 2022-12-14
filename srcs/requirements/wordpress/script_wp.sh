wp core download	--allow-root

wp config create	--allow-root\
					--dbname=$DB_NAME\
					--dbuser=$DB_USER\
					--dbpass=$DB_PASSWORD\
					--dbhost="mariadb"\
					--path=""

wp core install		--allow-root
					--admin_user=$ADMIN_USER\
					--admin_password=$ADMIN_PASSWORD\
					--admin_email=$ADMIN@example.com\
					--url=localhost\
					--title="Inception"\
					--skip-email


# wp user create   surement utile pour metre mettre le nouvel use non admin