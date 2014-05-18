#! /bin/bash

mkdir keys

ssh-keygen -f keys/dpanel-key-$1

DIRS=`find  -mindepth 1 -maxdepth 1 -type d -exec basename {} \;`

for dir in $DIRS; do cp keys/dpanel-key-$1.pub "$dir/dpanel_ssh_key.pub"; done

cp -f keys/dpanel-key-$1 utils/dpanel_ssh_key

for dir in $DIRS; do

docker build -t std$dir $dir/.

done
