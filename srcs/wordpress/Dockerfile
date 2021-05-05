FROM alpine:3.12

RUN apk update

RUN apk upgrade

RUN apk add wget

RUN apk add nginx

COPY ./nginx.conf /etc/nginx/conf.d/default.conf

RUN	apk add php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session supervisor \
	lighttpd php7-common php7-iconv php7-gd php7-curl php7-xml php7-imap php7-cgi nginx \
	fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix \
	php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

RUN		mkdir -p /usr/share/webapps

WORKDIR		/usr/share/webapps

RUN	wget https://wordpress.org/latest.tar.gz

RUN	tar -xvzf latest.tar.gz && rm -rf latest.tar.gz

RUN	chown -R lighttpd /usr/share/webapps/ && \
	ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress

RUN		mkdir -p /run/nginx
RUN		mkdir -p /var/run/php

COPY	./wp-config.php /usr/share/webapps/wordpress

COPY	./supervisord.conf	/etc/supervisord.conf

EXPOSE	5050

ENTRYPOINT	/usr/bin/supervisord -c /etc/supervisord.conf

