# Docker
![Docker Logo](http://upload.wikimedia.org/wikipedia/commons/7/79/Docker_%28container_engine%29_logo.png)

[Docker](http://www.docker.com) is an open platform for developers and sysadmins to build, ship, and run distributed applications.


## Installation
* [Docker for Windows](http://docs.docker.com/installation/windows/).
* [Docker for Mac](http://docs.docker.com/installation/mac/).


## Setting up a Docker development environment

### Access your local source code within Docker
In order to share a local Windows/Mac folder (the host system) with your Docker setup, follow these steps:
* Download [Boot2docker with VirtualBox Guest Additions](https://medium.com/boot2docker-lightweight-linux-for-docker/boot2docker-together-with-virtualbox-guest-additions-da1e3ab2465c)
* Make sure to use the ISO with VirtualBox Guest Additions as provided via the download link above. Place it in your home directory under 
`~/.boot2docker/boot2docker.iso` (Mac) or `%HOME%/.boot2docker/boot2docker.iso`, replacing the existing file. It's a good idea to do a backup of the original file.
* Init boot2docker:
  `boot2docker init`
* Mount your local folder on your Windows host system into the virtual box. Make sure the name of the share is `home`. The VM will automatically mount it to `/Users`:
  `VBoxManage sharedfolder add boot2docker-vm -name home -hostpath /path/to/your/sources`
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

However, the drawback with this solution is that all your source code is stored inside of the VM. If you delete the VM, your sources are gone. Ouch!


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
All Dockerfiles are provided _"as is"_. Automated trusted builds of these images are available for public consuption 
at the [Docker Hub](https://registry.hub.docker.com/repos/neroinc/).

* `neroinc/fedore-apache` - Plain and simple image with Apache httpd based on fedora:20
* `neroinc/fedora-apache-php` - Apache and PHP based on fedora:20
* `neroinc/fedora-apache-php-phalcon1.2` - Apache, PHP and the Phalcon PHP Framework 1.2 (phalconphp.com) based on fedora:20
* `neroinc/fedora-apache-php-phalcon` - Apache, PHP and the Phalcon PHP Framework 1.3 (phalconphp.com) based on fedora:20
* `neroinc/fedora-golang` - Go runtime and sample web app based on fedora:20
* `neroinc/fedora-memcached` - Installation of memcached based on fedora:20
* `neroinc/fedora-node` - Node.js image based on fedora:20

