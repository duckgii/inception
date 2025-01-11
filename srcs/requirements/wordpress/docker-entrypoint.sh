#!/bin/bash

# 종료 시 에러가 발생하면 스크립트를 중단
set -e

# WordPress 코어 다운로드 (이미 존재하는지 확인)
if [ ! -f wp-config.php ]; then
  echo "Downloading WordPress core..."
  wp core download --locale=ko_KR --allow-root
else
  echo "WordPress core already downloaded."
fi

# wp-config.php 생성 (이미 존재하는지 확인)
#if [ ! -f wp-config.php ]; then
echo "Creating wp-config.php..."
wp config create \
  --dbname=wordpress_db \
  --dbuser=my_user \
  --dbpass=my_password \
  --dbhost=mariadb \
  --allow-root
#else
#  echo "wp-config.php already exists."
#fi

# WordPress 설치 (이미 설치되어 있는지 확인)
#if ! wp core is-installed --allow-root; then
#  echo "Installing WordPress..."


wp db reset --yes --allow-root
wp core install \
  --url=localhost \
  --title="WP-CLI222" \
  --admin_user=wpcli \
  --admin_password=wpcli \
  --admin_email=info@wp-cli.org \
  --allow-root --debug


#else
#  echo "WordPress is already installed."

#fi

# 컨테이너가 실행 상태를 유지하도록
exec "$@"
