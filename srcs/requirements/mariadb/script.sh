#!/bin/sh

if [ ! -f "$PROTECT_FILE" ]
then
	#setup launch of mysql
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld

	#launch mysql in back ground 
	mysqld &
	while !(mysqladmin ping > /dev/null)
	do
		echo "Waiting for database to be ready..." 
	    sleep 5
	done
	echo "Database is ready"


	# setup database in mysql
	#mysql -uroot --skip-password -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
	mysql -uroot --skip-password -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASSWORD';"
	mysql -uroot -p$ROOT_PASSWORD -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
	mysql -uroot -p$ROOT_PASSWORD -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
	mysql -uroot -p$ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
	mysql -uroot -p$ROOT_PASSWORD -e "FLUSH PRIVILEGES;"

	mysqladmin -uroot -p$ROOT_PASSWORD shutdown
	touch "$PROTECT_FILE"
else
	echo "Database already created"
fi

exec mysqld 