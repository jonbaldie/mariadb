build:
	    - docker build -t jonbaldie/mariadb:latest .

test:
	    - docker run jonbaldie/mariadb which mysqld | grep '/usr/sbin/mysqld'
