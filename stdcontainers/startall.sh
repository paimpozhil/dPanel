#!/bin/bash

appname=$1

docker run -td --name $appname dp-data 

docker run --volumes-from $appname --name $appname-mysql  -p 3306:3306  -d stdmysql /sbin/my_init 

docker run  --link $appname-mysql:mysqldb --name $appname-nginx  --volumes-from $appname -p 80:80  -d stdnginx /sbin/my_init 

echo " $appname - created "
