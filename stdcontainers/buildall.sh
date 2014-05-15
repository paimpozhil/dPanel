#! /bin/bash

mkdir keys

ssh-keygen -f keys/dpanel-key-$1

for dir in */; do cp keys/dpanel-key-$1.pub "$dir/dpanel_ssh_key.pub"; done

cp -f keys/dpanel-key-$1 utils/dpanel_ssh_key

docker build -t dp-data data/.

docker build -t stdnginx nginxphp/.

docker build -t stdmysql mysql/.

docker build -t stdutils utils/.

docker build -t stdapache apachephp/.
