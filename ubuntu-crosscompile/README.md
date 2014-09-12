ubuntu-crosscompile
===================
Cross-compiling environment with gcc and g++ for ARM based on `ubuntu:trusty`.
Note that `ubuntu:utopic` contains a change to tzdata which [breaks Go compilation](https://code.google.com/p/go/issues/detail?id=8547) for now.

Build the image:
`docker build --rm -t neroinc/ubuntu-crosscompile .`

Start a container with an interactive shell and port 8080 published:
`docker run -it neroinc/ubuntu-crosscompile /bin/bash`

To mount your local work directory (e.g. using 
[Boot2docker with VirtualBox Guest Additions](https://medium.com/boot2docker-lightweight-linux-for-docker/boot2docker-together-with-virtualbox-guest-additions-da1e3ab2465c))
into a new docker container, run:
`docker run -it -v /Users/<workspace path>:/src/ neroinc/ubuntu-crosscompile /bin/bash`


Examples
--------
`CC=arm-linux-gnueabihf-gcc-4.7 CXX=arm-linux-gnueabihf-g++-4.7 node-gyp clean configure --arch=arm rebuild`
