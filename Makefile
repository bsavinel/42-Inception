# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bsavinel <bsavinel@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/16 12:25:26 by bsavinel          #+#    #+#              #
#    Updated: 2022/12/18 14:26:08 by bsavinel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	mkdir -p /home/bsavinel/data/vol_wordpress
	mkdir -p /home/bsavinel/data/vol_mariadb
	docker-compose -f ./srcs/docker-compose.yml up || true

build:
	docker-compose -f ./srcs/docker-compose.yml build

in_mariabd:
	docker-compose exec mariadb sh

in_wordpress:
	docker-compose exec wordpress sh

in_nginx:
	docker-compose exec nginx sh

clean:
	docker-compose -f ./srcs/docker-compose.yml down || true
	docker system prune -af || true

fclean: clean
	docker volume prune -f || true
	rm -rf /home/bsavinel/data/vol_mariadb || true
	rm -rf /home/bsavinel/data/vol_wordpress || true

re : fclean all