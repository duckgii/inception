# 베이스 이미지: 최신 Debian
FROM debian:bullseye

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

COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh


# WordPress 권한 설정
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html && \
	mkdir /run/php
	
RUN sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|" /etc/php/7.4/fpm/pool.d/www.conf

ENTRYPOINT ["bash",  "/docker-entrypoint.sh"]
CMD ["php-fpm7.4", "-F"]