FROM	alpine:3.12

RUN		apk update

RUN		apk upgrade

RUN		apk add nginx

RUN		apk add supervisor

RUN		apk add wget php7 php7-fpm php7-mysqli php7-mbstring php7-json php7-session

RUN		wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz

RUN		tar -xf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz

RUN		mkdir -p /www

RUN		mv phpMyAdmin-5.0.1-english /www/phpmyadmin

COPY		./config.inc.php		/www/phpmyadmin/

COPY		./nginx.conf 			/etc/nginx/conf.d/default.conf

COPY		./supervisord.conf		/etc/supervisord.conf

RUN		mkdir -p /run/nginx

EXPOSE	5000

ENTRYPOINT /usr/bin/supervisord -c /etc/supervisord.conf
