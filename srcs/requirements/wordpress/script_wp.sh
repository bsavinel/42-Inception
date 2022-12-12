wp core download	--allow-root

wp config create	--dbname=$DB_NAME\
					--dbuser=$DB_USER\
					--dbpass=$DB_PASSWORD\
					--dbhost=$DB_HOST\
					--allow-root

wp core install		--allow-root
					--admin_user=$ADMIN_USER\
					--admin_password=$ADMIN_PASSWORD\
					--admin_email=$ADMIN@example.com\
					--url=localhost\
					--title="Inception"\
					--skip-email


# wp user create   surement utile pour metre mettre le nouvel use non admin