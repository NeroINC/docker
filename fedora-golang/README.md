fedora-golang
=============
Go runtime and sample web app based on fedora:20

Go application source code goes into `/gopath/src/app`. 
However, for simplicity it is symlinked to `/src` to stay in line with our other images.

Build the image:
`docker build --rm -t neroinc/fedora-golang .`

Start a container with an interactive shell and port 8080 published:
`docker run -it -p 8080:8080 neroinc/fedora-golang /bin/bash`

The native `go` executable is available and can be used as usual. If your sources have been placed into the `/src` folder,
you can rely on the simple command line tools `/bin/go-build` to build the application, and `/bin/go-run` to launch it.
