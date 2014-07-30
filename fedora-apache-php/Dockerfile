#
# fedora-apache-php
#
FROM neroinc/fedora-apache

# Install PHP and dependencies
RUN yum -y install php php-common php-cli php-devel php-gd php-mbstring php-mcrypt php-xml php-pear php-pdo php-mysql php-mysqlnd php-pgsql php-pecl-memcache php-pecl-memcached php-pecl-apcu; yum clean all
RUN pear install channel://pear.php.net/XML_Serializer-0.20.2
RUN pear install channel://pear.php.net/XML_Parser2-0.1.0

# Configure PHP using custom VirtualHost configuration
ADD virtualhosts.conf /etc/httpd/conf.d/virtualhosts.conf

# We have all code in /src
WORKDIR /src
ADD index.php /src/index.php
RUN rm -rf /var/www/html; ln -s /src /var/www/html
