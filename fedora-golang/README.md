fedora-golang
=============
Go runtime and sample web app based on fedora:20

Go application source code goes into `/gopath/src/app`. 
However, for simplity it is symlinked to `/src` to stay in line with our other images.

Build the image:
`docker build --rm -t neroinc/fedora-golang .`

Start a container with an interactive shell and port 8080 published:
`docker run -it -p 8080:8080 neroinc/fedora-golang /bin/bash`

On command line invoke `/bin/go-build` to start a build and `/bin/go-run` to launch your application.
