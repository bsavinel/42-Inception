FROM    debian:buster

RUN     apt-get update && \
        apt-get install mariadb-server -y && \
        apt-get install mariadb-client -y

COPY	./mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY	./script.sh /script.sh

CMD     ["sh", "/script.sh"]