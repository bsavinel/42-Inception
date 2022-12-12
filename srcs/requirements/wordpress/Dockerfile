FROM	alpine:3.16.2

RUN		apk update
RUN		apk upgrade
RUN		apk add --no-cache curl \
		php8 \
		php8-common \
		php8-fpm \
		php8-pdo \
		php8-opcache \
		php8-zip \
		php8-phar \
		php8-iconv \
		php8-cli \
		php8-curl \
		php8-openssl \
		php8-mbstring \
		php8-tokenizer \
		php8-fileinfo \
		php8-json \
		php8-xml \
		php8-xmlwriter \
		php8-simplexml \
		php8-dom \
		php8-pdo_mysql \
		php8-pdo_sqlite \
		php8-tokenizer \
		php8-pecl-redis
RUN		curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

COPY	script_wp.sh /script_wp.sh

CMD [./script_wp.sh]