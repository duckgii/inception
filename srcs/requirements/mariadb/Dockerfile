FROM debian:bullseye

RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install -y mariadb-server mariadb-client && \
    apt-get clean && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /run/mysqld && \
    chown -R mysql:mysql /run/mysqld

# bind-address 설정 해제\
RUN echo "\n[mysqld]\nbind-address = 0.0.0.0\nport = 3306" >> /etc/mysql/my.cnf
RUN sed -i 's|^socket = /run/mysqld/mysqld.sock|# &|' /etc/mysql/my.cnf

# 초기화 SQL 스크립트 복사
COPY docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

# 포트 공개
EXPOSE 3306
ENTRYPOINT ["bash",  "/docker-entrypoint.sh"]

# 실행 명령어 (이미지를 컨테이너로 실행할 때 기본적으로 실행될 명령)
CMD ["mysqld"]