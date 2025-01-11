.PHONY: up down

up:
	docker compose -f srcs/docker-compose.yaml up -d --build

down:
	docker compose -f srcs/docker-compose.yaml down --rmi all
	docker volume rm srcs_wordpressDB
	docker volume rm srcs_mariadbDB


re :
	make down
	make up
