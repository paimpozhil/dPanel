#!/bin/bash


while getopts ":a:dhnupmlx" opt; do
  case $opt in	
     a)
        appname=$OPTARG
        docker run -td --name $appname imgdata
        ;;

    d)
    docker run --volumes-from $appname --name $appname-mysql  -p 3306  -d imgmysql /sbin/my_init
    mylink=" --link $appname-mysql:mysqldb"
	;;
    p)
    docker run  -e VIRTUAL_HOST=$appname -e VIRTUAL_PORT=80 $mylink --name $appname-apache  --volumes-from $appname -p 80  -d imgapachephp53
    apachelink=" --link $appname-apache:apache"
 	;;
    n)
    docker run  -e VIRTUAL_HOST=$appname -e VIRTUAL_PORT=80 $mylink --name $appname-nginx  --volumes-from $appname -p 80  -d imgnginx /sbin/my_init
    nginxlink=" --link $appname-nginx:nginx"
 	;;
    x)
    docker run  -e VIRTUAL_HOST=$appname -e VIRTUAL_PORT=80 $mylink --name $appname-nginxphp53  --volumes-from $appname -p 80  -d imgnginxphp53 /sbin/my_init
    nginxphp53=" --link $appname-nginxphp53:nginxphp53"
	;;
    l)
	docker run  -e VIRTUAL_HOST=$appname  --name $appname-lamp  --volumes-from $appname  -p 80 -p 3306 -d imglamp 
	lamplink=" --link $appname-lamp:lamp"
        ;;
    u)
    docker run $mylink $nginxphp53 $lamplink $apachelink $nginxlink --name $appname-utils --volumes-from $appname -p 22  -d imgutils /sbin/my_init
                   ;;
    
    h)
    echo "startall.sh -a appname -x {fornginx php53} -d {formysql} -p {forapache php53} -u {forutils} -n {for nginx php55 } -l {for apachephp53 plus mysql}"
    echo "sample usage ./startall.sh -a yourwebsite.com -n -d -u or ./startall.sh -a yourwebsite -l -u"
		;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
	
      ;;
  esac
done

#echo " $appname - created "
