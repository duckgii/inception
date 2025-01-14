.PHONY: up down

all:
	mkdir -p /home/yeoshin/data/wordpress
	mkdir -p /home/yeoshin/data/mariadb
	make up

up:
	docker compose -f srcs/docker-compose.yaml up -d --build

down:
	docker compose -f srcs/docker-compose.yaml down --rmi all
	docker volume rm mariadbDB
	docker volume rm wordpressDB
	sudo rm -rf /home/yeoshin/data

clean : 
	docker compose -f srcs/docker-compose.yaml down --rmi all
	docker volume rm mariadbDB
	docker volume rm wordpressDB

re :
	make down
	make all
