SHELL = /bin/bash

.PHONY: clean build deploy all

all: deploy

clean:
	rm -r build

build: clean
	bundle exec middleman build

deploy: build
	bundle exec middleman s3_sync
