#!/bin/bash

appname=$1

docker rm `docker ps -a | grep $appname | cut -c-12`

echo "all containers removed"
