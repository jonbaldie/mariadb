#!/bin/sh

mysql_install_db

mysql -u root < cat <<EOF
USE mysql;
GRANT ALL ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

BOOTSTRAP_DIR=/mysql-bootstrap.d

if [ "$(ls -A $BOOTSTRAP_DIR)" ]; then
    for z in $BOOTSTRA_DIR/*.sql; do
        mysql -u root mysql < "$z"
    done
fi

mysqld --user=root 
