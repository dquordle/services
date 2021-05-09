FROM	alpine:3.12

RUN		apk update

RUN		apk upgrade

RUN		apk add vsftpd openssl supervisor

RUN		echo "root:qwerty" | chpasswd

RUN		openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Tatarstan/L=Kazan/O=21school/OU=Eternity/CN=dquordle" -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt;

COPY	./vsftpd.conf /etc/vsftpd/

COPY	./supervisord.conf /etc/supervisord.conf

EXPOSE  21 30021

ENTRYPOINT	/usr/bin/supervisord -c /etc/supervisord.conf
