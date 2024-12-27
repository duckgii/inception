FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server mariadb-client && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld
RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get -y install mariadb-server
RUN apt-get install -y vim
RUN sed -i 's/^bind-address\s*=.*/#&/' /etc/mysql/mariadb.conf.d/50-server.cnf

# Maintainer 정보 (선택 사항)
LABEL maintainer="your_email@example.com"

# MariaDB 설정을 위한 환경 변수
ENV MARIADB_ROOT_PASSWORD=rootpassword \
    MARIADB_DATABASE=my_database \
    MARIADB_USER=my_user \
    MARIADB_PASSWORD=my_password

# 작업 디렉토리 설정
WORKDIR /docker-entrypoint-initdb.d

# 초기화 SQL 스크립트 복사
# COPY init.sql /docker-entrypoint-initdb.d/

# MariaDB 설정 파일 복사
COPY conf /etc/mysql/conf.d/

# 포트 공개
EXPOSE 3306

# 실행 명령어 (이미지를 컨테이너로 실행할 때 기본적으로 실행될 명령)
CMD ["mysqld"]
