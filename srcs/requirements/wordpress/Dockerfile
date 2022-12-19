FROM	alpine:3.16.2

RUN		apk update
RUN		apk upgrade
RUN		apk add --no-cache curl	\
		php8					\
		php8-common				\
		php8-fpm				\
		php8-mysqli				\
		php8-phar				\
		php8-mbstring			\
		mariadb-client


RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN		mv wp-cli.phar /usr/local/bin/wp
RUN		chmod +x /usr/local/bin/wp
RUN		mkdir -p /var/www/wordpress


COPY	./script_wp.sh /script_wp.sh

CMD ["sh", "./script_wp.sh"]