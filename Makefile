
all:
	@mkdir -p /home/${USER}/data/wordpress
	@mkdir -p /home/${USER}/data/mariadb
	docker-compose -f ./srcs/docker-compose.yml up -d --build
stop:
	docker-compose -f ./srcs/docker-compose.yml down
clean:
	docker system prune -f
re:
	@make stop
	docker system prune -f

