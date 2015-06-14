# brother.ly

[![Build Status](https://travis-ci.org/waxpoetic/brother.ly.svg?branch=master)](https://travis-ci.org/waxpoetic/brother.ly)
[![Code Climate](https://codeclimate.com/github/waxpoetic/brother.ly/badges/gpa.svg)](https://codeclimate.com/github/waxpoetic/brother.ly)

The official website for [Wax Poetic Records][waxpoetic]' late-night
intimate streaming events. Every month, we select the best producers of
Philadelphia's booming electronic music scene and showcase their latest
and greatest work in an ultra-private setting. The location is never
publicly announced, but anyone can experience a live stream of the event by visiting
http://brother.ly.

Please [open an issue][new-issue] if you find anything wrong with the site.

## Installation

Clone this repo and run the Makefile to build the entire project into a
static HTML site:

```bash
$ git clone git://github.com/waxpoetic/brother.ly.git
$ cd brother.ly
$ bundle && make
```

## Development

This statically-served site was built with [Middleman][mm], [Haml][haml]
and [Sass SCSS][sass]. Commits to master are deployed automatically with
[Travis CI][ci] if the build passes all specs and Rubocop linting. We do
accept contributions, but they must be made in a pull request and that
pull request must pass all tests in CI.

We use [Pow][pow] for our development server, and a `config.ru` for
use with Pow has been provided in this repository. If you do not use
Pow, you can run the Middleman server by executing the following
command:

```bash
$ make watch
```

You can also build the project into static files at any time:

```bash
$ make clean build
```

## License

The MIT License (MIT)

Copyright (c) 2015 Wax Poetic Music, LLC

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

[waxpoetic]: http://waxpoeticrecords.com
[new-issue]: https://github.com/waxpoetic/brother.ly/issues/new
[mm]: http://middlemanapp.com
[haml]: http://haml-lang.com
[sass]: http://sass-lang.com
[ci]: http://travis-ci.org
[pow]: http://pow.cx
