#!/bin/sh

if [ ! -f $PROTECT_FILE ]
then
	#setup launch of mysql
	mysql_install_db  --datadir=/var/lib/mysql --user=mysql --auth-root-authentication-method=normal
	mkdir -p /run/mysqld
	chown -R mysql:mysql /run/mysqld

	#launch mysql in back ground 
	mysqld &
	while !(mysqladmin ping > /dev/null)
	do
	    sleep 5
	done

	#setup database in mysql
	mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@localhost IDENTIFIED BY '$DB_PASSWORD';"
	mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@localhost IDENTIFIED BY '$DB_PASSWORD';"
	mysql -e "CREATE DATABASE IF NOT EXISTS $DB_WORDPRESS;"
	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$ROOT_PASSWORD';"
	mysql -e "FLUSH PRIVILEGES;"

	mysqladmin shutdown
	touch $PROTECT_FILE
else
	echo "Database already created"
fi