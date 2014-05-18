#!/bin/bash

appname=$1

docker stop `docker ps | grep $appname- | cut -c-12`

echo "all stopped"
