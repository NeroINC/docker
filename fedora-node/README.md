fedora-node
===========
Node.js image based on fedora:20

This image also contains the Development Tools in order to build node modules that make use of native code.

By default `app.js` is started and port 8000 is exposed. Extend your image to run `npm install` or use a custom launch configuration.

Build the image:
`docker build --rm -t neroinc/node .`

Start a container with an interactive shell and port 8000 published:
`docker run -it -p 8000:8000 neroinc/node /bin/bash`

Run node as usual:
`node /src/app.js`
