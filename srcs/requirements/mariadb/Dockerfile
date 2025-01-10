FROM debian:bullseye

RUN apt-get update && apt-get install -y mariadb-server mariadb-client && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld
RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get -y install mariadb-server
RUN apt-get install -y vim
# bind-address 설정 해제\
RUN echo "\n[mysqld]\nbind-address = 0.0.0.0\nport = 3306" >> /etc/mysql/my.cnf
RUN sed -i 's|^socket = /run/mysqld/mysqld.sock|# &|' /etc/mysql/my.cnf
RUN sed -i 's|^socket = /run/mysqld/mysqld.sock|# &|' /etc/mysql/mariadb.cnf


#RUN sed -i 's/^bind-address\s*=.*/#&/' /etc/mysql/mariadb.conf.d/50-server.cnf
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

# Maintainer 정보 (선택 사항)
LABEL maintainer="your_email@example.com"

# MariaDB 설정을 위한 환경 변수
ENV MARIADB_ROOT_PASSWORD=password \
    MARIADB_DATABASE=wordpress_db \
    MARIADB_USER=my_user \
    MARIADB_PASSWORD=my_password

# 작업 디렉토리 설정
WORKDIR /docker-entrypoint-initdb.d

# 초기화 SQL 스크립트 복사
COPY init.sql /docker-entrypoint-initdb.d/
COPY docker-entrypoint.sh /docker-entrypoint-initdb.d/
RUN chown 755 /docker-entrypoint-initdb.d/docker-entrypoint.sh

# MariaDB 데이터 디렉토리 권한 설정 (필요 시)
RUN chown -R mysql:mysql /docker-entrypoint-initdb.d/

# MariaDB 초기화 명령어 실행
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

# MariaDB 설정 파일 복사
COPY conf /etc/mysql/conf.d/

# 포트 공개
EXPOSE 3306

ENTRYPOINT ["bash",  "/docker-entrypoint-initdb.d/docker-entrypoint.sh"]
#ENTRYPOINT ["mysql",  "-u",  "root",  "-e",  "source /docker-entrypoint-initdb.d/init.sql"]
# 실행 명령어 (이미지를 컨테이너로 실행할 때 기본적으로 실행될 명령)
CMD ["mysqld"]
#mysql -u root -e "source /docker-entrypoint-initdb.d/init.sql