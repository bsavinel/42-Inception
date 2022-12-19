#!/bin/sh

if [ ! -f "$PROTECT_FILE" ]
then
	#setup launch of mysql
	mysql_install_db  --datadir=/var/lib/mysql --user=mysql --auth-root-authentication-method=normal
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

	#setup database in mysql
	mysql -e "DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');"
	mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
	mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
	mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
	#mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH 'mysql_native_password' BY '$ROOT_PASSWORD';"
	mysql -e "FLUSH PRIVILEGES;"

	mysqladmin shutdown
	touch "$PROTECT_FILE"
else
	echo "Database already created"
fi

exec mysqld 