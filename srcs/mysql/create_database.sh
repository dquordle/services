#!/bin/sh

mariadb-install-db -u root
mysqld -u root & sleep 5

mysql -u root -e "create database wordpress;"
mysql -u root wordpress < wordpress.sql
mysql -u root -e "create user 'root'@'%' identified by 'qwerty';"
mysql -u root -e "grant all privileges on wordpress.* to 'root'@'%' identified by 'qwerty' with grant option;"
mysql -u root -e "flush privileges;"

/usr/bin/supervisord -c /etc/supervisord.conf
