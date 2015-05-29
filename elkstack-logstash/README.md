elkstack-logstash
=================
Based on the official [Logstash](https://registry.hub.docker.com/_/logstash/)
docker image with a default config file and a startup delay to give 
Elasticsearch enough time to startup and run EC2 discovery.

Default config is can be overwritten by mounting a host volume at `/etc/logstash/conf.d/logstash.conf`.

There's a shared data partition that can be used to persist plugin data (e.g. `sincedb` files). Mount
a host volume at `/usr/share/logstash/data`. Access rights will be set automatically.

Logstash startup will be delayed until there's a running Elasticsearch instance available 
at http://elasticsearch:9200. So when using this image make sure to not use link your Elasticsearch 
instance as `elasticsearch` and have it listen on port `9200` (the default). Otherwise this image
will *not* start up.

