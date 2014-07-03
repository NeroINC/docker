#
# fedora-node
#
FROM fedora:20
MAINTAINER "stoupin" <stoupin@nero.com>

# Install nodejs and build tools
RUN yum -y update; yum clean all
RUN yum -y install deltarpm; yum clean all
RUN yum -y groupinstall "Development Tools"; yum clean all
RUN yum -y install autoconf; yum clean all
RUN yum -y install npm; yum clean all

# Setup sample app
WORKDIR /src
ADD app.js /src/app.js

EXPOSE 8000
CMD ["node", "app.js"]
