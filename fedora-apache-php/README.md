fedora-apache-php
=================
Apache and PHP based on fedora:20

PHP code goes into `/src`. The default setup shows the PHP info page.

Build the image:
`docker build --rm -t neroinc/fedora-apache-php .`

Start a container with an interactive shell and port 80 published:
`docker run -it -p 80:80 neroinc/fedora-apache-php /bin/bash`

Invoke `/bin/httpd-run` on command line to launch Apache with a simple demo web page.
