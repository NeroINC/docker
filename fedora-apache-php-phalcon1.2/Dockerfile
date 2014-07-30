#
# fedora-apache-php
#
FROM neroinc/fedora-apache-php

# Install phalcon
RUN yum -y groupinstall "Development Tools"; yum clean all
RUN yum -y install re2c; yum clean all

RUN cd ~; git clone https://github.com/phalcon/cphalcon -b 1.2.6 --single-branch
RUN cd ~/cphalcon/build; ./install; rm -rf ~/cphalcon
RUN echo extension=phalcon.so > /etc/php.d/phalcon.ini
