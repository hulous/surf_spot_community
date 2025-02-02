APPLICATION_NAME = surf_spot_community
WEB_CONTAINER_NAME = $(APPLICATION_NAME)-web
.DEFAULT_GOAL := help

CONTAINER_APP_MANAGER = docker ## Podman vs Docker

# Docker stuff
attach: ## Attach running web container to see logs
	$(CONTAINER_APP_MANAGER) attach $(APPLICATION_NAME)_$(WEB_CONTAINER_NAME)_1

up: ## Run containers
	$(CONTAINER_APP_MANAGER) compose up

upd: ## Run containers "detached"
	$(CONTAINER_APP_MANAGER) compose up -d

down: ## Stop containers
	$(CONTAINER_APP_MANAGER) compose down

serve: up ## Run Serve
	make attach

ps: ## List containers
	$(CONTAINER_APP_MANAGER) compose ps

restart_web: ## Restart Web container
	$(CONTAINER_APP_MANAGER) compose restart $(WEB_CONTAINER_NAME)

# Build containers
build: ## Build containers
	$(CONTAINER_APP_MANAGER) compose build

clean: down ## Cleanup docker images.
	$(CONTAINER_APP_MANAGER) system prune -a

rebuild: clean ## Stop containers, delete docker images not used and build container
	make build

# Rails install tools
bundle: ## Run bundle install
	$(CONTAINER_APP_MANAGER) compose run --rm $(WEB_CONTAINER_NAME) bundle install

migrate: ## Run rake db migrate
	$(CONTAINER_APP_MANAGER) compose run --rm $(WEB_CONTAINER_NAME) bundle exec rake db:migrate

init_db: ## drop, create and migrate DB (Data will be lost)
	$(CONTAINER_APP_MANAGER) compose run --rm $(WEB_CONTAINER_NAME) bundle exec rake db:drop db:create db:migrate

import_seeds: ## Run Wecasa rake task to import seeds
	$(CONTAINER_APP_MANAGER) compose run --rm $(WEB_CONTAINER_NAME) bundle exec rake db:seeds:wecasa_tech_test:import

# Devs console
bash: ## Run bash in web-container
	$(CONTAINER_APP_MANAGER) compose run --rm $(WEB_CONTAINER_NAME) bash

console: ## Run Rails console
	$(CONTAINER_APP_MANAGER) compose run --rm $(WEB_CONTAINER_NAME) bundle exec rails c

# Code smells tools
sniff: ## Run code smelling tools (rubocop, reek, brakeman and fasterer only for now)
	- make rubocop
	- make reek

rubocop: ## Run project rubocop
	$(CONTAINER_APP_MANAGER) compose run --rm $(WEB_CONTAINER_NAME) bundle exec rubocop .

reek: ## Run project reek
	$(CONTAINER_APP_MANAGER) compose run --rm $(WEB_CONTAINER_NAME) bundle exec reek .

brakeman: ## Run project brakeman
	$(CONTAINER_APP_MANAGER) compose run --rm $(WEB_CONTAINER_NAME) bundle exec brakeman .

fasterer: ## Run project fasterer
	$(CONTAINER_APP_MANAGER) compose run --rm $(WEB_CONTAINER_NAME) bundle exec fasterer .

# tests
tests: ## Run test locally in web container (with failfast and code coverage option)
	$(CONTAINER_APP_MANAGER) compose run -e COVERAGE=true --rm $(WEB_CONTAINER_NAME) bundle exec rspec

# Other things
.PHONY: help

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
