# 베이스 이미지로 debian 사용
FROM debian:bullseye

# 필수 패키지 설치
RUN apt update && apt install -y nginx

# Nginx 설정 파일 복사 (필요한 경우)
# COPY ./default.conf /etc/nginx/sites-available/default

# Nginx 시작 시 항상 포그라운드에서 실행되도록 설정
CMD ["nginx", "-g", "daemon off;"]