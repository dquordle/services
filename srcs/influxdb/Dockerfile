FROM alpine:3.12

RUN apk update

RUN apk upgrade

RUN apk add supervisor influxdb

RUN apk add telegraf --no-cache --repository http://dl-2.alpinelinux.org/alpine/edge/community

RUN mkdir /etc/telegraf/

RUN ./usr/bin/telegraf -sample-config --input-filter docker --output-filter influxdb > /etc/telegraf/telegraf.conf

COPY ./supervisord.conf   /etc/supervisord.conf

EXPOSE 8086

ENTRYPOINT /usr/bin/supervisord -c /etc/supervisord.conf
