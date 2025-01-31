#!/bin/bash
set -e

mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
#-- Set root password
echo "FLUSH PRIVILEGES;" >> /init.sql
echo "ALTER USER $MARIADB_ROOT@'localhost' IDENTIFIED BY '$MARIADB_ROOT_PASSWORD';" >> /init.sql

#-- Create database
echo "CREATE DATABASE IF NOT EXISTS $MARIADB_DATABASE;" >> /init.sql

#-- Create user and grant privileges
echo "CREATE USER IF NOT EXISTS $MARIADB_USER@'%' IDENTIFIED BY '$MARIADB_PASSWORD';" >> /init.sql
echo "GRANT ALL PRIVILEGES ON $MARIADB_DATABASE.* TO $MARIADB_USER@'%';" >> /init.sql

# 추가 작업 실행
mysqld -u mysql --bootstrap < /init.sql

exec "$@"