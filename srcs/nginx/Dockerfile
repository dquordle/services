FROM alpine:3.12

RUN apk update

RUN apk upgrade

RUN apk add nginx  openssl

COPY ./nginx.conf /etc/nginx/conf.d/default.conf

RUN openssl req -x509 -nodes -days 365 -subj "/C=RU/ST=Tatarstan/L=Kazan/O=21school/OU=Eternity/CN=dquordle" -newkey rsa:2048 -keyout /etc/ssl/nginx-selfsigned.key -out /etc/ssl/nginx-selfsigned.crt;

RUN	mkdir -p /run/nginx

EXPOSE 80 443

ENTRYPOINT nginx -g 'daemon off;'
