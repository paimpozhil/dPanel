#! /bin/bash

while getopts ":k:dhnupmlx" opt; do
  case $opt in	

    k)
	keyname=$OPTARG
	mkdir -p keys
	ssh-keygen -f keys/$keyname

	DIRS=`find  -mindepth 1 -maxdepth 1 -type d -exec basename {} \;`

	for dir in $DIRS; do cp keys/$keyname.pub "$dir/dpanel_ssh_key.pub"; done

	cp -f keys/$keyname utils/dpanel_ssh_key

##build the data container without anyones permission lol
	docker build -t imgdata data/.

	;;


    d)
	docker build -t imgmysql mysql/.
	;;
    p)
	docker build -t imgapachephp53 apachephp53/.
	;;
    n)
        docker build -t imgnginx nginx/.
 	;;
    x)
	docker build -t imgnginxphp53 nginxphp53/.
	;;
    l)
	docker build -t imglamp lamp/.
                  ;;
    u)
	docker build -t imgutils utils/.
                   ;;
    
    h)
    echo "buildall.sh -k keyname -x {fornginx php53} -d {formysql} -p {forapache php53} -u {forutils} -n {for nginx php55 } -l {for apachephp53 plus mysql}"
    echo "sample usage ./buildall.sh -k mykey -n -d -u or ./buildalll.sh -k mykey -l -u"
		;;
    \?)
      echo "Invalid option: -$OPTARG" >&2

      ;;
  esac
done

