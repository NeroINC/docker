#!/bin/bash

set -e

# Wait for the Elasticsearch container to be ready before starting Logstash.
# This is especially important if Logstash tries to upload its default template or tries to
# push events to Elasticsearch while that is still registering itself in the cluster.
if grep -q elasticsearch "/etc/hosts"; then
	echo "Stalling for Elasticsearch (2 minutes)"
	while true; do
		timeout 1 bash -c 'cat < /dev/null > /dev/tcp/elasticsearch/9200' 2>/dev/null && break
	done
	sleep 120
fi

# Run original entry point script
/docker-entrypoint.sh $@