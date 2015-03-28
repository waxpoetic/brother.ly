# These are the build scripts for the brother.ly official site. Using
# this file, the entire site can be compiled and installed by running a
# single command: `make`.

SHELL = /bin/bash

.PHONY: config clean build deploy test check server all

all: build

vendor/bundle:
	bundle install --path=vendor/bundle --quiet

config:
	cp .env.development .env

clean:
	rm -rf build

build: vendor/bundle clean
	bundle exec middleman build --verbose

check: vendor/bundle
	bundle exec rubocop

test: check
	bundle exec rspec
