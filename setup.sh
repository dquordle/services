#!/bin/bash

minikube delete
minikube start --vm-driver=virtualbox --cpus 4 --memory 3000
eval $(minikube docker-env)
docker pull metallb/speaker:v0.8.2
docker pull metallb/controller:v0.8.2
minikube addons enable metallb

docker build -t nginx_image srcs/nginx
docker build -t wordpress_image srcs/wordpress
docker build -t mysql_image srcs/mysql
docker build -t phpmyadmin_image srcs/phpmyadmin
docker build -t ftps_image srcs/ftps
docker build -t grafana_image srcs/grafana
docker build -t influxdb_image srcs/influxdb

kubectl apply -f srcs/configmap.yaml
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/mysql/mysql.yaml
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f srcs/wordpress/wordpress.yaml
kubectl apply -f srcs/ftps/ftps.yaml
kubectl apply -f srcs/grafana/grafana.yaml
kubectl apply -f srcs/influxdb/influxdb.yaml

minikube dashboard
