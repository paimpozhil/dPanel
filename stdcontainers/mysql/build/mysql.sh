#!/usr/bin/env bash

if [ ! -f /var/lib/mysql/initialized ]; then

chown -R mysql:mysql /var/lib/mysql

mysql_install_db 

echo "about to start mysql"

/usr/bin/mysqld_safe  &

RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MySQL service startup"
    sleep 5
    mysql -uroot -e "status" > /dev/null 2>&1
    RET=$?
done

echo "=> Creating MySQL admin user with m"
mysql -uroot -e "CREATE USER 'admin'@'%'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION"

touch /var/lib/mysql/initialized
mysqladmin -uroot shutdown

fi

mysqld_safe
