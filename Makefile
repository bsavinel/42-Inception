clean:
	docker ps -aq | xargs docker stop | xargs docker rm; docker rmi $(docker images -aq)

nginx:
nginx -c /nginx.conf -g "daemon off;"