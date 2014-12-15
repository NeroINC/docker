#
# fedora-golang
#
FROM fedora:20

# Update distribution
RUN yum -y update; yum clean all

# Install Go
RUN yum -y groupinstall "Development Tools"; yum clean all
RUN mkdir /goroot && curl https://storage.googleapis.com/golang/go1.4.linux-amd64.tar.gz | tar xvzf - -C /goroot --strip-components=1
RUN mkdir /gopath

# Install dependencies (such as Mercurial which is required for log4go)
RUN yum -y install hg; yum clean all

# Setup environment
ENV GOROOT /goroot
ENV GOPATH /gopath
ENV PATH $PATH:$GOROOT/bin:$GOPATH/bin

# Add build and run scripts
ADD go-build /bin/go-build
ADD go-run /bin/go-run

# Setup simple hello world app
ADD hello.go /src/hello.go
RUN mkdir -p /gopath/src; rm -rf /gopath/src/app/; ln -s /src /gopath/src/app
#RUN /bin/go-build

# ONBUILD ADD . /gopath/src/app/
# ONBUILD RUN /bin/go-build

EXPOSE 8080
CMD ["/bin/go-run"]
#ENTRYPOINT ["/bin/go-run"]
