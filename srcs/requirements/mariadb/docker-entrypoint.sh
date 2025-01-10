#!/bin/bash
set -e

# 추가 작업 실행
#mysql -u root -e "source /docker-entrypoint-initdb.d/init.sql"
mysqld -u mysql --bootstrap < /docker-entrypoint-initdb.d/init.sql

exec "$@"