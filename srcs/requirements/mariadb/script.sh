#!/bin/sh

# Varible for the script
PASSWDDB="StrongPass123!"
USER="bsavinel"

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
mysql -e "CREATE USER '$USER'@localhost IDENTIFIED BY '$PASSWDDB';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$USER'@localhost IDENTIFIED BY '$PASSWDDB';"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "CREATE DATABASE IF NOT EXISTS wordpress;"
