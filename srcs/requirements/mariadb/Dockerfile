FROM	alpine:3.16.2

RUN		apk update
RUN		apk upgrade
RUN		apk add --no-cache mariadb \
		mariadb-client

COPY	./mariadb.conf /etc/my.cnf.d/mariadb-server.cnf
COPY	./script.sh /script.sh



CMD		["sh", "/script.sh"]