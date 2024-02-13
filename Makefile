DC := docker-compose

all: up

build:
	$(DC) build

clean:
	$(DC) down --rmi all -v
	sudo rm -rf build node_modules

deploy: predeploy
	sudo chown -R $(USER):$(USER) build node_modules
	npm run deploy

down:
	$(DC) down

exec: up
	docker exec -it app sh

logs:
	$(DC) logs -f

predeploy: up
	docker exec -it app npm run build

up:
	$(DC) up -d

.PHONY: all clean deploy down exec logs up
