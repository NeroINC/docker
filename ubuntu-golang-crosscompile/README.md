ubuntu-golang-crosscompile
==========================
Go 1.4 runtime based on `ubuntu:trusty`, set up for cross compilation to Linux (i386, AMD64, ARM) and Windows (i386, AMD64).
Note that `ubuntu:utopic` contains a change to tzdata which [breaks Go compilation](https://code.google.com/p/go/issues/detail?id=8547) for now.

Go is installed to `/goroot/bin`, application source code goes into `/gopath/src/`.

Build the image:
`docker build --rm -t neroinc/ubuntu-golang-crosscompile .`

Start a container with an interactive shell and port 8080 published:
`docker run -it -p 8080:8080 neroinc/ubuntu-golang-crosscompile /bin/bash`

To mount your local work directory (e.g. using [Boot2docker](http://boot2docker.io/))
into a new docker container, run:
`docker run -it -p 8080:8080 -v /Users/<workspace path>:/gopath/src/<your domain> neroinc/ubuntu-golang-crosscompile /bin/bash`

Examples
--------
Build your application (thanks to [mazzolino](https://registry.hub.docker.com/u/mazzolino/) for the tip):
`docker run -it --rm -v $GOPATH:/gopath -w /gopath/src/example.com/my/example -e GOOS=linux -e GOARCH=arm -e GOARM=7 neroinc/ubuntu-golang-crosscompile go build -v -o example-armv7`

Or with [CGO](https://github.com/golang/go/wiki/cgo) enabled:
`docker run -it --rm -v $GOPATH:/gopath -w /gopath/src/example.com/my/example -e CC=arm-linux-gnueabihf-gcc-4.7 -e GOOS=linux -e GOARCH=arm -e GOARM=7 -e CGO_ENABLED=1 neroinc/ubuntu-golang-crosscompile go build -v -o example-armv7`

Now you should have a new executable called `example-armv7` inside your project directory.

This should work with boot2docker as well if you have `$GOPATH` inside your `/Users` subdirectory.
