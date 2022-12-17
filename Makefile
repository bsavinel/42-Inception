# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bsavinel <bsavinel@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/16 12:25:26 by bsavinel          #+#    #+#              #
#    Updated: 2022/12/17 13:36:56 by bsavinel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	mkdir -p /home/bsavinel/data/vol_wordpress
	mkdir -p /home/bsavinel/data/vol_mariadb
	docker-compose -f ./srcs/docker-compose.yml up

clean:
	docker-compose -f ./srcs/docker-compose.yml down
	docker system prune -af || true

fclean: clean
	docker volume prune -f || true
	rm -rf /home/bsavinel/data/vol_mariadb || true
	rm -rf /home/bsavinel/data/vol_wordpress || true

re : fclean all