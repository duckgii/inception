# 베이스 이미지: 최신 Debian
FROM debian:bullseye

# 환경 변수 설정 (비대화형 설치) -> 패키지 설치에서 대화 x
ENV DEBIAN_FRONTEND=noninteractive

# 필수 패키지 업데이트 및 설치
RUN apt-get update && apt-get install -y \
    php7.4 \
    php7.4-mysql \
    php7.4-curl \
    php7.4-fpm \
    php7.4-xml \
    php7.4-mbstring \
    mariadb-client \
    curl \
    unzip \
    wget \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
	


WORKDIR /var/www/html

# wp-cli 다운로드
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod -R 755 wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

#COPY init.sh /docker-entrypoint-initdb.d/
#RUN chown 755 /docker-entrypoint-initdb.d/init.sh
#RUN sh -c "while ! nc -z mariadb 3306; do sleep 1; done;"
# Wordpress 다운로드
#RUN wp core download --allow-root;
    #wp config create --dbname=wordpress_db --dbuser=my_user --dbpass=my_password --dbhost=mariadb --allow-root ;&& \
    #wp config create --dbname=wordpress_db --dbuser=my_user --dbpass=my_password --dbhost=mariadb --allow-root ;
    #wp db create --allow-root && \
    #wp core install --url=localhost --title="WP-CLI" --admin_user=wpcli --admin_password=wpcli --admin_email=info@wp-cli.org --allow-root

#RUN curl -O https://wordpress.org/latest.tar.gz && \
#    tar -xzf latest.tar.gz --strip-components=1 && \
#    rm latest.tar.gz
COPY init.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

# WordPress 권한 설정
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html && \
	mkdir /run/php

#RUN	cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
	
RUN sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|" /etc/php/7.4/fpm/pool.d/www.conf

CMD ["php-fpm7.4", "-F"]
