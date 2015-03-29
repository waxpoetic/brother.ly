# These are the build scripts for the brother.ly official site. Using
# this file, the entire site can be compiled and installed by running a
# single command: `make`.

SHELL = /bin/bash

.PHONY: build config clean check test watch all

all: test build

clean:
	rm -rf build

check:
	bundle exec rubocop

build: clean
	bundle exec middleman build --verbose

test: check
	bundle exec rspec

config:
	cp .env.development .env

watch:
	bundle exec middleman server
