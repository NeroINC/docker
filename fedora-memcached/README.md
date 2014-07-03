fedora-memcached
================
Installation of memcached based on fedora:20 

Build the image:
`docker build --rm -t neroinc/fedora-memcached .`

Start a container with `memcached` running:
`docker run -d -p 11211:11211 --name memcached neroinc/fedora-memcached`

This will make `memcached` run and being published on port 11211 (which is the default). You can switch this port if there's a local `memcached` service already running.

Use `telnet` in order to test if `memcached` is running properly:
```
telnet localhost 11211
Trying 127.0.0.1...
Connected to localhost.
Escape character is '^]'.
stats
STAT pid 1
STAT uptime 165
STAT time 1387383960
STAT version 1.4.15
STAT libevent 2.0.21-stable
```

That's it. You can use this `memcached` container and link it to your dependent containers.
