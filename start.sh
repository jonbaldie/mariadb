#!/bin/sh

mkdir -p /run/mysqld
mkdir -p /mysql-bootstrap.d

mysql_install_db

<<EOF > /tmp/grant.sql
USE mysql;
GRANT ALL ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

mysqld --user=root --boostrap < /tmp/grant.sql
rm -f /tmp/grant.sql

BOOTSTRAP_DIR=/mysql-bootstrap.d

if [ "$(ls -A $BOOTSTRAP_DIR)" ]; then
    for z in $BOOTSTRA_DIR/*.sql; do
        mysql -u root mysql < "$z"
    done
fi

mysqld --user=root 
