# 베이스 이미지: Debian
FROM debian:bullseye

# 환경 변수 설정 (비대화형 설치)
ENV DEBIAN_FRONTEND=noninteractive

# 필수 패키지 설치
RUN apt-get update && apt-get install -y \
    nginx \
    openssl \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# SSL 인증서 생성
RUN mkdir -p /etc/nginx/ssl && \
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/nginx/ssl/nginx-selfsigned.key \
    -out /etc/nginx/ssl/nginx-selfsigned.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/OU=Department/CN=localhost"

	# Ensure proper permissions for web root
RUN mkdir -p /var/www/html \
		&& chown -R www-data:www-data /var/www/html \
		&& chmod -R 755 /var/www/html

RUN sed -i '/fastcgi_index/d' /etc/nginx/snippets/fastcgi-php.conf

# Nginx 설정 복사
COPY conf /etc/nginx/sites-available/default

# 포트 공개
EXPOSE 443

# Nginx 실행
CMD ["nginx", "-g", "daemon off;"]
