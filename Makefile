COMPOSE_FILE := srcs/docker-compose.yml
DATA_DIR := /home/aylaaouf/data
DOMAIN_NAME := aylaaouf.42.fr
HOST_IP ?= 127.0.0.1

.PHONY: all hosts build up down restart logs clean fclean re

all: hosts up

hosts:
	@if grep -qE '^[^#]*[[:space:]]$(DOMAIN_NAME)([[:space:]]|$$)' /etc/hosts; then \
		if grep -qE '^$(HOST_IP)[[:space:]]+$(DOMAIN_NAME)([[:space:]]|$$)' /etc/hosts; then \
			echo "$(DOMAIN_NAME) is already configured for $(HOST_IP)"; \
		else \
			sudo sed -i -E '/^[^#]*[[:space:]]$(DOMAIN_NAME)([[:space:]]|$$)/c\\$(HOST_IP) $(DOMAIN_NAME)' /etc/hosts; \
			echo "Updated $(DOMAIN_NAME) to $(HOST_IP) in /etc/hosts"; \
		fi; \
	else \
		printf '%s %s\n' "$(HOST_IP)" "$(DOMAIN_NAME)" | sudo tee -a /etc/hosts >/dev/null; \
		echo "Added $(HOST_IP) $(DOMAIN_NAME) to /etc/hosts"; \
	fi

build:
	mkdir -p $(DATA_DIR)/db_data $(DATA_DIR)/wordpress_data
	docker compose -f $(COMPOSE_FILE) build

up: hosts build
	docker compose -f $(COMPOSE_FILE) up -d

down:
	docker compose -f $(COMPOSE_FILE) down

restart: down up

logs:
	docker compose -f $(COMPOSE_FILE) logs -f

clean: down
	docker compose -f $(COMPOSE_FILE) rm -f

fclean: clean
	docker compose -f $(COMPOSE_FILE) down -v --rmi all
	sudo rm -rf $(DATA_DIR)/db_data $(DATA_DIR)/wordpress_data

re: fclean all