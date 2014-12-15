#
# ubuntu-golang-crosscompile
#
FROM neroinc/ubuntu-crosscompile

# Install Go
RUN mkdir /goroot && curl https://storage.googleapis.com/golang/go1.4.linux-amd64.tar.gz | tar xvzf - -C /goroot --strip-components=1
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
