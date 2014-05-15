#!/bin/bash

appname=$1

echo "stopping .."
docker stop $appname
echo "stopping .."
docker stop $appname-mysql
echo "stoppping .."
docker stop $appname-nginx
echo "stopping .."
docker stop $appname-utils
echo "stopping .."
docker stop $appname-apache


echo "all stopped"
