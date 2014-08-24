#
# ubuntu-golang-crosscompile
#
FROM ubuntu:trusty

# Packaged dependencies
RUN	apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq \
	automake \
	build-essential \
	curl \
	ca-certificates \
	git \
	mercurial \
	--no-install-recommends; \
	apt-get clean

# Install ARM cross compiler and i386 header files
RUN DEBIAN_FRONTEND=noninteractive apt-get install -yq \
	gcc-multilib \
	libc6-dev-i386 \
	gcc-4.7-multilib-arm-linux-gnueabi \
	gcc-4.7-multilib-arm-linux-gnueabihf \
	--no-install-recommends; \
	apt-get clean
# See https://bugs.launchpad.net/ubuntu/+source/linux/+bug/778047
RUN ln -s /usr/include/asm-generic /usr/include/asm

# Install Go
RUN mkdir /goroot && curl https://storage.googleapis.com/golang/go1.3.1.linux-amd64.tar.gz | tar xvzf - -C /goroot --strip-components=1
RUN mkdir /gopath

# Download and build Go sources
#RUN mkdir /goroot; mkdir /gopath
#RUN cd /goroot; hg clone https://code.google.com/p/go /goroot
#RUN cd /goroot/src; ./all.bash

ENV GOROOT /goroot
ENV GOPATH /gopath
ENV PATH $GOROOT/bin/:$GOPATH/bin/:$PATH

# Build Go cross compiler libraries
# (We could use https://github.com/davecheney/golang-crosscompile.git here, but it's only a script anyway)
ENV	DOCKER_CROSSPLATFORMS linux/386 linux/amd64 linux/arm windows/386 windows/amd64
RUN	cd /goroot/src && bash -xc 'for platform in $DOCKER_CROSSPLATFORMS; do GOOS=${platform%/*} GOARCH=${platform##*/} GOARM=7 ./make.bash --no-clean 2>&1; done'
