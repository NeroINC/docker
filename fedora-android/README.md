fedora-android
==============
Android build and test environment based on fedora:20.
This image contains:
* OpenJDK 7
* Android SDK r24
* Android Build Tools 21.1.0 and 21.1.1
* Apache Ant 1.9.4
* Maven 3.2.5
* Gradle 2.2.1

Build the image:
`docker build --rm -t neroinc/fedora-android .`

Start a container with an interactive shell:
`docker run -it neroinc/fedora-android /bin/bash`

To mount your local work directory (e.g. using [Boot2docker](http://boot2docker.io/))
into a new docker container, run:
`docker run -it -v /Users/<workspace path>:/src neroinc/fedora-android /bin/bash`

Or you can directly run a build, e.g. using gradle:
`docker run -it -v /Users/<workspace path>:/src neroinc/fedora-android /src/gradlew`
