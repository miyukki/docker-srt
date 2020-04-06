DOCKER_USER ?= miyukki
DOCKER_NAME ?= srt
DOCKER_TAG  ?= latest
SRT_BRANCH  ?= master

.PHONY: all
all: build push

.PHONY: build
build:
	docker build -t $(DOCKER_USER)/$(DOCKER_NAME):$(DOCKER_TAG) --build-arg branch=$(SRT_BRANCH) .

.PHONY: push
push:
	docker push $(DOCKER_USER)/$(DOCKER_NAME):$(DOCKER_TAG)