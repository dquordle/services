FROM alpine:3.12

RUN apk update

RUN apk upgrade

RUN apk add libc6-compat

RUN wget https://dl.grafana.com/oss/release/grafana-7.3.6.linux-amd64.tar.gz

RUN tar -zxvf grafana-7.3.6.linux-amd64.tar.gz

RUN rm grafana-7.3.6.linux-amd64.tar.gz

RUN mv grafana-7.3.6 grafana

WORKDIR /grafana/bin

COPY ./grafana.db /grafana/data/grafana.db

EXPOSE 3000

ENTRYPOINT     /grafana/bin/grafana-server
