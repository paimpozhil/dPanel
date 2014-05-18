#!/bin/bash


while getopts ":a:dhnupml" opt; do
  case $opt in	
     a)
        appname=$OPTARG
        docker run -td --name $appname stddata
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
    m)
    docker run  -e VIRTUAL_HOST=$appname $mylink --name $appname-nginxphp53  --volumes-from $appname -p 80  -d stdnginxphp53 /sbin/my_init
    nginxphp53=" --link $appname-nginxphp53:nginxphp53"
	;;
    l)
	docker run  -e VIRTUAL_HOST=$appname  --name $appname-lamp  --volumes-from $appname -p 80 -p 3306 -d stdlamp 
	lamplink=" --link $appname-lamp:lamp"
        ;;
    u)
    docker run $mylink $nginxphp53 $lamplink $apachelink $nginxlink --name $appname-utils --volumes-from $appname -p 22  -d stdutils /sbin/my_init
                   ;;
    
    h)
    echo "startall.sh -a appname -n {fornginx} -d {formysql} -p {forapache} -u {forutils} -m {for php53 }"
    echo "sample usage ./startall.sh yourwebsite.com -n -d -u"
		;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
	
      ;;
  esac
done

#echo " $appname - created "
