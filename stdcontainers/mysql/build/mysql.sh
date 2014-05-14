#!/usr/bin/env sh


if [ ! -f /var/lib/mysql/ibdata1 ]; then
chmod 0777 /var/lib/mysql* -R
chown mysql:mysql /var/lib/mysql* -R

    mysql_install_db
fi

mysqld_safe
