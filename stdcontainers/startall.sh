#!/bin/bash


while getopts ":a:dhnup" opt; do
  case $opt in	
     a)
        appname=$OPTARG
        docker run -td --name $appname dp-data
        ;;

    d)
    docker run --volumes-from $appname --name $appname-mysql  -p 3306  -d stdmysql /sbin/my_init
    mylink=" --link $appname-mysql:mysqldb"
	;;
    p)
    docker run  -e VIRTUAL_HOST=$appname $mylink --name $appname-apache  --volumes-from $appname -p 80  -d stdapache
    apachelink=" --link $appname-apache:apache"
 	;;
    n)
    docker run  -e VIRTUAL_HOST=$appname $mylink --name $appname-nginx  --volumes-from $appname -p 80  -d stdnginx /sbin/my_init
    nginxlink=" --link $appname-nginx:nginx"
 	;;
    u)
    docker run $mylink   $apachelink $nginxlink --name $appname-utils --volumes-from $appname -p 22  -d stdutils /sbin/my_init
                   ;;
    h)
    echo "startall.sh -a appname -n {fornginx} -d {formysql} -p {forapache} -u {forutils}"
    echo "sample usage ./startall.sh yourwebsite.com -n -d -u"
		;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
	
      ;;
  esac
done

#echo " $appname - created "
