#
# ubuntu-crosscompile
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
	g++-4.7-multilib-arm-linux-gnueabi \
	g++-4.7-multilib-arm-linux-gnueabihf \
	--no-install-recommends; \
	apt-get clean
# See https://bugs.launchpad.net/ubuntu/+source/linux/+bug/778047
RUN ln -s /usr/include/asm-generic /usr/include/asm
