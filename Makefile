# brother.ly Makefile

SHELL = /bin/bash

.PHONY: clean build deploy all

all: build

clean:
	rm -r build

build: clean
	bundle exec middleman build

deploy: build
	bundle exec middleman s3_sync
