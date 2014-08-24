ubuntu-golang-crosscompile
==========================
Go 1.3.1 runtime based on `ubuntu:trusty`, set up for cross compilation to Linux (i386, AMD64, ARM) and Windows (i386, AMD64).
Note that `ubuntu:utopic` contains a change to tzdata which [breaks Go compilation](https://code.google.com/p/go/issues/detail?id=8547) for now.

Go is installed to `/goroot/bin`, application source code goes into `/gopath/src/`.

Build the image:
`docker build --rm -t neroinc/ubuntu-golang-crosscompile .`

Start a container with an interactive shell and port 8080 published:
`docker run -it -p 8080:8080 neroinc/ubuntu-golang-crosscompile /bin/bash`

To mount your local work directory (e.g. using 
[Boot2docker with VirtualBox Guest Additions](https://medium.com/boot2docker-lightweight-linux-for-docker/boot2docker-together-with-virtualbox-guest-additions-da1e3ab2465c))
into a new docker container, run:
`docker run -it -p 8080:8080 -v /Users/<workspace path>:/gopath/src/<your domain> neroinc/ubuntu-golang-crosscompile /bin/bash`

Examples
--------
Building your application with target architecture `linux/arm`, switch to the application source folder and run: 
`CC=arm-linux-gnueabihf-gcc-4.7 GOOS=linux GOARCH=arm GOARM=7 CGO_ENABLED=1 go build -v`
