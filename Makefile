AWS_CLI_VERSION = 1.15.59
IMAGE_NAME ?= contino/aws-cli:$(AWS_CLI_VERSION)
TAG = $(AWS_CLI_VERSION)

build:
	docker build -t $(IMAGE_NAME) .

test:
	docker run --rm -it $(IMAGE_NAME) aws --version
	docker run --rm -it $(IMAGE_NAME) jp --version

shell:
	docker run --rm -it -v ~/.aws:/root/.aws -v $(shell pwd):/opt/app $(IMAGE_NAME) bash

gitTag:
	-git tag -d $(TAG)
	-git push origin :refs/tags/$(TAG)
	git tag $(TAG)
	git push origin $(TAG)