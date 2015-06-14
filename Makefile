# These are the build scripts for the brother.ly official site. Using
# this file, the entire site can be compiled and installed by running a
# single command: `make`.

SHELL = /bin/bash

.PHONY: config clean check test watch all

all: test clean build

clean:
	rm -rf build

check: vendor/bundle
	bundle exec rubocop

build: vendor/bundle
	bundle exec middleman build --verbose

test: vendor/bundle check
	bundle exec rspec --format=documentation

config:
	cp .env.development .env

watch: vendor/bundle
	bundle exec middleman server

vendor/bundle:
	bundle install --path=vendor/bundle
