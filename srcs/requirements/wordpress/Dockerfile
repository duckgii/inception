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

# WordPress 다운로드 및 설치
RUN curl -O https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz --strip-components=1 && \
    rm latest.tar.gz

# WordPress 권한 설정
RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 755 /var/www/html && \
	mkdir /run/php
	
RUN sed -i "s|listen = /run/php/php7.4-fpm.sock|listen = 0.0.0.0:9000|" /etc/php/7.4/fpm/pool.d/www.conf

CMD ["php-fpm7.4", "-F"]
