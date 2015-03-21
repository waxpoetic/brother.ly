#
# Makefile for the brother.ly official site
#

SHELL = /bin/bash

.PHONY: clean build deploy test all

all: build

clean:
	rm -rf build

vendor/bundle:
	bundle install --quiet

build: vendor/bundle clean
	bundle exec middleman build

deploy: build
	bundle exec middleman s3_sync

test:
	bundle exec middleman server
