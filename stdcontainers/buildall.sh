#! /bin/bash

docker build -t dp-data data/.

docker build -t stdnginx nginxphp/.

docker build -t stdmysql mysql/.
