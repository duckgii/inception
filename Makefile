.PHONY: up down

all:
	mkdir -p ./data/wordpress
	mkdir -p ./data/mariadb
	make up

up:
	docker compose -f srcs/docker-compose.yaml up -d --build

down:
	docker compose -f srcs/docker-compose.yaml down --rmi all
	docker volume rm mariadbDB
	docker volume rm wordpressDB
#rm -rf ./data


re :
	make down
	make all
