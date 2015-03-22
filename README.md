# brother.ly

The official website for [Wax Poetic Records][waxpoetic]' late-night
intimate streaming events. Every month, we select the best producers of
Philadelphia's booming electronic music scene and showcase their latest
and greatest work in an ultra-private setting. The location is never
publicly announced, but anyone can experience a live stream of the event by visiting
http://brother.ly.

## Installation

Clone this repo and run the Makefile to build the entire project into a
static HTML site:

```bash
$ git clone git://github.com/waxpoetic/brother.ly.git
$ cd brother.ly
$ make
```

## Deployment

We host http://brother.ly on Amazon Web Services, originating the files
from S3 and utilizing the CloudFront CDN for speed. In order to use the
deployment command, you need to have certain environment variables set.
For security reasons, these environment variables do not come packaged
with the codebase:

```bash
$ export AWS_ACCESS_KEY_ID='your-iam-users-access-key'
$ export AWS_SECRET_ACCESS_KEY='your-iam-users-secret-key'
$ export AWS_S3_BUCKET_NAME='by-default-this-is-brother.ly'
$ export AWS_CDN_DISTRO_ID='find-this-on-the-cloudfront-page'
```

Alternatively, you can use the built-in dotenv support:

```bash
$ cp .env.development .env
$ vi .env
```

It will automatically be picked up by middleman and inserted into the
app.

Once those environment variables are set, go ahead and run the
deployment command:

```bash
$ make deploy
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
