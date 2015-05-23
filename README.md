# Docker
![Docker Logo](http://upload.wikimedia.org/wikipedia/commons/7/79/Docker_%28container_engine%29_logo.png)

[Docker](http://www.docker.com) is an open platform for developers and sysadmins to build, ship, and run distributed applications.


## Installation
* [Docker for Windows](http://docs.docker.com/installation/windows/).
* [Docker for Mac](http://docs.docker.com/installation/mac/).


## Setting up a Docker development environment

### Access your local source code within Docker
In order to share a local Windows/Mac folder (the host system) with your Docker setup, follow these steps:
* Download and install [Boot2Docker](http://boot2docker.io/)
* Init Boot2Docker: `boot2docker init`
* Mount your local folder on your Windows host system into the virtual box. Make sure the name of the share is `Users`. The VM will automatically mount it to `/Users`: `VBoxManage sharedfolder add boot2docker-vm -name Users -hostpath /path/to/your/sources` (names other than `Users` are _not_ supported!)
* Now it's time to startup the VM and connect to it. Type `boot2docker up` to start up the VM, followed by `boot2docker ssh` to login to it.
* As an alternative to `boot2docker ssh` you can also use any regular SSH tool such as Putty or simply the command line `ssh`.

That's it! Now you have a running VM with docker installed and your local directory conveniently mounted into `/Users`.

### Access sources through SMB
As an alternative for better performance, instead of mounting your host's file system into the VM, you can mount the VM's file system in Windows using SMB. 
An introduction to this is available here: https://github.com/boot2docker/boot2docker
```bash
# Make a volume container (only need to do this once)
$ docker run -v /data --name my-data busybox true
# Share it using Samba (Windows file sharing)
$ docker run --rm -v /usr/local/bin/docker:/docker -v /var/run/docker.sock:/docker.sock svendowideit/samba my-data
# then find out the IP address of your Boot2Docker host
$ boot2docker ip
192.168.59.103
```

However, the drawback of this solution is that all your source code is stored inside of the VM. If you delete the VM, your sources are gone. Ouch!


## Helper Scripts
The following helper scripts are based on various sources found publically on the Internet such as 
[Jim Hoskins' Remove Untagged Images From Docker](http://jimhoskins.com/2013/07/27/remove-untagged-docker-images.html),
[Stackoverflow](http://stackoverflow.com/questions/17236796/how-to-remove-old-docker-io-containers) and others.
Use at your own risk!

* `docker-rm-old.sh` - delete all docker containers that are 1 week old
* `docker-rm-stopped.sh` - delete all stopped docker containers
* `docker-rm-untagged.sh` - delete all untagged docker containers
* `docker-rmi-untagged.sh` - delete all untagged docker images


## Dockerfiles
All Dockerfiles are provided _"as is"_. Automated trusted builds of these images are available for public consumption 
at the [Docker Hub](https://registry.hub.docker.com/repos/neroinc/).

### Web Server
Apache, Memcached, PHP, Node, etc.

* `neroinc/fedora-apache` - Plain and simple image with Apache httpd based on fedora:20
* `neroinc/fedora-apache-php` - Apache and PHP based on fedora:20
* `neroinc/fedora-apache-php-phalcon` - Apache, PHP and the Phalcon PHP Framework 1.3 (phalconphp.com) based on fedora:20
* `neroinc/fedora-apache-php-phalcon1.2` - Apache, PHP and the Phalcon PHP Framework 1.2 (phalconphp.com) based on fedora:20
* `neroinc/fedora-memcached` - Installation of memcached based on fedora:20
* `neroinc/fedora-node` - Node.js image based on fedora:20

### Android Platform
Android SDK and emulator

* `neroinc/fedora-android` - Android build and test environment based on fedora:20

### C/C++

* `neroinc/ubuntu-crosscompile` - Base image for cross compilation based on ubuntu:utopic

### Go/Golang
Go (Programming Language)

* `neroinc/fedora-golang` - Go runtime and sample web app based on fedora:20
* `neroinc/ubuntu-golang-crosscompile` - Go runtime based on ubuntu:utopic, set up for cross compilation to Linux (i386, AMD64, ARM) and Windows (i386, AMD64).

### SonarQube
Source Quality Analysis and Management

* `neroinc/sonar-mysql` - SonarQube database setup
* `neroinc/sonar-server` - SonarQube server setup

### Elkstack
Elasticsearch, Logstash and Kibana

* `neroinc/elkstack-elasticsearch` - Elasticsearch with Curator and additional plugins
* `neroinc/elkstack-logstash` - Logstash with default config file
