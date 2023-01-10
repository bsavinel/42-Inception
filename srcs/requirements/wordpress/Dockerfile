FROM	debian:buster

RUN		apt-get update
RUN		apt-get install  curl	\
		php7.3					\
		php7.3-fpm				\
		php7.3-cli				\
		php-mysql				\
		mariadb-client -y

RUN		mkdir -p /run/php/
RUN		chmod 777 /run/php

RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		mv wp-cli.phar /usr/local/bin/wp
RUN		chmod +x /usr/local/bin/wp
RUN		mkdir -p /var/www/html/wordpress

COPY	./www.conf /etc/php/7.3/fpm/php-fpm.conf
RUN		chmod -R 777 /etc/php/7.3/fpm/php-fpm.conf
RUN		chown -R www-data:www-data /etc/php/7.3/fpm/php-fpm.conf

COPY	./script_wp.sh /script_wp.sh

CMD ["sh", "./script_wp.sh"]