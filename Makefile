# Docker Hub username (optional for build, required for push). Example: make push DOCKER_USER=myuser
DOCKER_USER ?=
IMAGE := $(if $(DOCKER_USER),$(DOCKER_USER)/gha-runner,gha-runner)
SHA := $(shell git rev-parse --short HEAD 2>/dev/null || echo "unknown")

.PHONY: build push

build:
	docker build -t $(IMAGE):latest .
	docker tag $(IMAGE):latest $(IMAGE):$(SHA)

push: build
	@[ -n "$(DOCKER_USER)" ] || (echo "DOCKER_USER is required. Example: make push DOCKER_USER=myuser" && exit 1)
	docker push $(IMAGE):latest
	docker push $(IMAGE):$(SHA)
