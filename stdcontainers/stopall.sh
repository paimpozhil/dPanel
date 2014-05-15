#!/bin/bash

appname=$1

docker stop $appname
docker stop $appname-mysql
docker stop $appname-nginx

echo "all stopped"
