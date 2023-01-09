FROM	debian:buster

RUN		apt-get update
RUN		apt-get install  curl	\
		php8					\
		php8-common				\
		php8-fpm				\
		php8-mysqli				\
		php8-phar				\
		php8-mbstring			\
		mariadb-client -y


RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		mv wp-cli.phar /usr/local/bin/wp
RUN		chmod +x /usr/local/bin/wp
RUN		mkdir -p /var/www/html/wordpress
RUN		rm /etc/php8/php-fpm.d/www.conf
COPY	./www.conf /etc/php8/php-fpm.d/www.conf

COPY	./script_wp.sh /script_wp.sh

CMD ["sh", "./script_wp.sh"]