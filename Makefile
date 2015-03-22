#
# Makefile for the brother.ly official site
#

SHELL = /bin/bash

.PHONY: config clean build deploy test check server all

all: build

config:
	cp .env.development .env

clean:
	rm -rf build

build: clean
	bundle exec middleman build --verbose

check:
	bundle exec rubocop

test: check build
