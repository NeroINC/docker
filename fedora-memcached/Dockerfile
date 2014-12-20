#
# fedora-memcached
#
FROM  fedora:20

# Install memcached
RUN yum -y update; yum clean all
RUN yum -y install memcached; yum clean all

# Run it...
EXPOSE  11211
CMD  ["memcached", "-u", "daemon"]
