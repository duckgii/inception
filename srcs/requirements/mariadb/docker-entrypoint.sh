#!/bin/bash
set -e

#-- Set root password
echo "FLUSH PRIVILEGES;" >> /init.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY 'password';" >> /init.sql

#-- Create database
echo "CREATE DATABASE wordpress_db;" >> /init.sql

#-- Create user and grant privileges
echo "CREATE USER 'my_user'@'%' IDENTIFIED BY 'my_password';" >> /init.sql
echo "GRANT ALL PRIVILEGES ON wordpress_db.* TO 'my_user'@'%';" >> /init.sql
# ->여기 환경변수 수정하다가 에러발생

# 추가 작업 실행
mysqld -u mysql --bootstrap < /init.sql

exec "$@"