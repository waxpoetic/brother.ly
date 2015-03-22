#
# Makefile for the brother.ly official site
#

SHELL = /bin/bash

.PHONY: clean build deploy test all

all: build

clean:
	rm -rf build

build: clean
	bundle exec middleman build

deploy: build
	bundle exec middleman s3_sync

test:
	bundle exec rubocop
	bundle exec middleman server
