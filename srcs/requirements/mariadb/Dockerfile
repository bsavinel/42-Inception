FROM alpine:3.16.2

RUN apk update
RUN apk upgrade
RUN apk add mariadb
RUN apk add mariadb-client
EXPOSE 3306
COPY ./mariadb.conf /etc/my.cnf.d/mariadb-server.cnf
COPY ./script.sh /script.sh
RUN sh /script.sh
CMD ["mysqld"]