elkstack-logstash
=================
Based on the official [Logstash](https://registry.hub.docker.com/_/logstash/)
docker image with a default config file and a startup delay to give 
Elasticsearch enough time to startup and run EC2 discovery.

Default config is can be overwritten by mounting a host volume at `/etc/logstash/conf.d/logstash.conf`.

