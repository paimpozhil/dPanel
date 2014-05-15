#! /bin/bash

mkdir keys

ssh-keygen -f keys/dpanel-key-$1

for dir in */; do cp keys/dpanel-key-$1.pub "$dir/dpanel_ssh_key.pub"; done


docker build -t dp-data data/.

docker build -t stdnginx nginxphp/.

docker build -t stdmysql mysql/.

docker build -t stdutils utils/.
