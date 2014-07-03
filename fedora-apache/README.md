fedora-apache
=============
Plain and simple image with Apache httpd based on fedora:20

Build the image:
`docker build --rm -t neroinc/fedora-apache .`

Start a container with an interactive shell and port 80 published:
`docker run -it -p 80:80 neroinc/fedora-apache /bin/bash`

Invoke `/bin/httpd-run` on command line to launch Apache with a simple demo web page.
