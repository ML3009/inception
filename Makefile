all:
	@sudo mkdir -p /home/ml/data/mariadb /home/ml/data/wordpress /home/ml/data/website
	@sudo chmod 777 /home/ml/data/mariadb /home/ml/data/wordpress /home/ml/data/website
	@docker-compose -f ./srcs/docker-compose.yml up --build -d

clean:
	@docker-compose -f ./srcs/docker-compose.yml down
	@docker system prune -af
	@sudo rm -rf /home/ml/data/mariadb /home/ml/data/wordpress /home/ml/data/website
	@docker volume prune -af

re:
	clean all

.PHONY: all clean re