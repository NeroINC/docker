#!/bin/bash

set -e

# Wait for the Elasticsearch container to be ready before starting Logstash.
# This is especially important if Logstash tries to upload its default template or tries to
# push events to Elasticsearch while that is still registering itself in the cluster.
if grep -q elasticsearch "/etc/hosts"; then
	echo "Stalling for Elasticsearch"
	while true; do
		timeout 1 bash -c 'cat < /dev/null > /dev/tcp/elasticsearch/9200' 2>/dev/null && break
	done
fi

# Add logstash as command if needed
if [[ "$1" == -* ]]; then
	set -- logstash "$@"
fi

# Run as user "logstash" if the command is "logstash"
if [ "$1" == logstash ]; then
	echo "Starting Logstash"

	# Change the ownership of /usr/share/logstash/data to logstash
	chown -R logstash:logstash /usr/share/logstash/data
	set -- gosu logstash "$@"
fi

echo "Starting Logstash"
exec "$@"