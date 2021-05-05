FROM	alpine:3.12

RUN		apk update

RUN		apk upgrade

RUN		apk add mariadb mariadb-client supervisor

RUN		mkdir -p /run/mysqld/

COPY	./my.cnf			/etc/

COPY	./supervisord.conf		/etc/supervisord.conf

COPY	./create_database.sh		/
COPY	./wordpress.sql		    /

RUN chmod 755 /create_database.sh

EXPOSE	3306

VOLUME	["var/lib/mysql"]

CMD	sh create_database.sh
