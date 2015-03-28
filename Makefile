# These are the build scripts for the brother.ly official site. Using
# this file, the entire site can be compiled and installed by running a
# single command: `make`.

SHELL = /bin/bash

.PHONY: build config clean check test watch vendor/bundle all

all: build

build: vendor/bundle clean
	bundle exec middleman build --verbose

config:
	cp .env.development .env

clean:
	rm -rf build

check: vendor/bundle
	bundle exec rubocop

test: check
	bundle exec rspec

watch:
	bundle exec middleman server

vendor/bundle:
	bundle install --path=vendor/bundle --quiet
