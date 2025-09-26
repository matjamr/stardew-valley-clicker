MAKEFLAGS += -j$(shell nproc)

.PHONY: all api-gateway user-service build up down logs prepare

all: api-gateway user-service

define get_version
$(shell mvn -q -Dexec.executable=echo -Dexec.args='${project.version}' \
  --non-recursive exec:exec -f apps/backend/$1/pom.xml)
endef

define build_service
	@VERSION=$$(cd apps/backend/$1 && mvn help:evaluate -Dexpression=project.version -q -DforceStdout); \
	if [ -z "$$VERSION" ]; then echo "❌ Could not resolve version from $1/pom.xml"; exit 1; fi; \
	echo "Building $1 version $$VERSION"; \
	docker build \
		-f docker/backend/Dockerfile \
		--build-arg APP_DIR=apps/backend/$1 \
		--build-arg APP_NAME=$1 \
		-t technikbober/$1:$$VERSION .
endef

api-gateway:
	$(call build_service,api-gateway)

user-service:
	$(call build_service,user-service)


build: all

up:
	docker compose up -d

down:
	docker compose down

logs:
	docker compose logs -f

prepare:
	@echo "Copying .env.example from docker/backend/* to apps/backend/*/.env..."
	@for dir in docker/backend/*; do \
		if [ -f "$$dir/.env.example" ]; then \
			app_dir=$$(basename $$dir); \
			cp "$$dir/.env.example" "apps/backend/$$app_dir/.env"; \
			echo "Copied $$dir/.env.example to apps/backend/$$app_dir/.env"; \
		fi; \
	done