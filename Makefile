#
# Makefile for the brother.ly official site
#

SHELL = /bin/bash

.PHONY: clean build deploy test check server all

all: build

clean:
	rm -rf build

build: clean
	bundle exec middleman build

deploy: build
	bundle exec middleman s3_sync

check:
	bundle exec rubocop

server:
	bundle exec middleman server

test: check server
