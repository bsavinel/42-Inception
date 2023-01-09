# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bsavinel <bsavinel@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/16 12:25:26 by bsavinel          #+#    #+#              #
#    Updated: 2022/12/19 17:12:26 by bsavinel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	mkdir -p /home/bsavinel/data/vol_wordpress
	mkdir -p /home/bsavinel/data/vol_mariadb
	sudo chmod 777 /home/bsavinel/data/vol_wordpress
	sudo chmod 777 /home/bsavinel/data/vol_mariadb
	docker compose -f ./srcs/docker-compose.yml build || true
	docker compose -f ./srcs/docker-compose.yml up -d || true

build:
	docker compose -f ./srcs/docker-compose.yml build || true

stop:
	docker compose -f ./srcs/docker-compose.yml stop || true

down: stop
	docker compose -f ./srcs/docker-compose.yml down || true

clean:
	docker compose -f ./srcs/docker-compose.yml stop || true
	docker compose -f ./srcs/docker-compose.yml down || true
	docker system prune -af || true

fclean: clean
	docker volume prune -f || true
	sudo rm -rf /home/bsavinel/data/vol_mariadb || true
	sudo rm -rf /home/bsavinel/data/vol_wordpress || true

re : fclean all

in_mariabd:
	docker exec -it mariadb sh

in_wordpress:
	docker exec -it wordpress sh

in_nginx:
	docker exec -it nginx sh

log :
	docker compose -f srcs/docker-compose.yml logs