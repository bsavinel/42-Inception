# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bsavinel <bsavinel@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/12/16 12:25:26 by bsavinel          #+#    #+#              #
#    Updated: 2022/12/16 17:07:21 by bsavinel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all:
	mkdir -p /home/bsavinel/data/vol_wordpress
	mkdir -p /home/bsavinel/data/vol_mariadb
	docker-compose -f ./srcs/docker-compose.yml up

clean:
	docker-compose -f ./srcs/docker-compose.yml down
	docker system prune -af

fclean: clean
	docker volume prune -af
	rm -rf /home/bsavinel/data/vol_mariadb
	rm -rf /home/bsavinel/data/vol_wordpress