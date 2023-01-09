FROM	debian:buster

RUN		apt-get update
RUN		apt-get install nginx openssl -y

RUN		openssl req -x509 -days 365 -nodes \
		-subj "/C=FR/ST=Paris/L=Paris/O=42/OU=42/CN=localhost/UID=bsavinel" \
		-keyout /etc/ssl/private/nginx-selfsigned.key \
		-out /etc/ssl/certs/nginx-selfsigned.crt
RUN		chmod 777 /etc/ssl/private/nginx-selfsigned.key
RUN		chmod 777 /etc/ssl/certs/nginx-selfsigned.crt

RUN		adduser 'www'
COPY	./nginx.conf /etc/nginx/nginx.conf

EXPOSE	443

CMD		["nginx", "-g", "daemon off;"]