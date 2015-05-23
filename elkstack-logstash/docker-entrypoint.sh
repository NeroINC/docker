#!/bin/bash

set -e

# Wait for the Elasticsearch container to be ready before starting Logstash.
echo "Stalling for Elasticsearch"
while true; do
	timeout 1 bash -c 'cat < /dev/null > /dev/tcp/elasticsearch/9200' 2>/dev/null && break
done

# Add logstash as command if needed
if [[ "$1" == -* ]]; then
	set -- logstash "$@"
fi

# Run as user "logstash" if the command is "logstash"
if [ "$1" == logstash ]; then
	set -- gosu logstash "$@"
fi

exec "$@"