FROM	debian:buster

RUN		apt-get update
RUN		apt-get install nginx openssl -y

RUN 	adduser www
RUN 	mkdir -p /var/www/html/
RUN 	chown -R www:www /var/lib/nginx
RUN 	chown -R www:www /var/www/html/
RUN 	chmod 755 /var/www/html

RUN		openssl req -x509 -days 365 -nodes \
		-subj "/C=FR/ST=Paris/L=Paris/O=42/OU=42/CN=localhost/UID=bsavinel" \
		-keyout /etc/ssl/private/nginx-selfsigned.key \
		-out /etc/ssl/certs/nginx-selfsigned.crt
RUN		chmod 777 /etc/ssl/private/nginx-selfsigned.key
RUN		chmod 777 /etc/ssl/certs/nginx-selfsigned.crt

RUN 	mkdir -p /var/run/nginx
COPY	./nginx.conf /etc/nginx/nginx.conf

EXPOSE	443

CMD		["nginx", "-g", "daemon off;"]