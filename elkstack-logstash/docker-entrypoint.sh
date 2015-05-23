#!/bin/bash

set -e

echo "Wait for Elasticsearch server to come up..."
sleep 60

# Add logstash as command if needed
if [[ "$1" == -* ]]; then
	set -- logstash "$@"
fi

# Run as user "logstash" if the command is "logstash"
if [ "$1" == logstash ]; then
	set -- gosu logstash "$@"
fi

exec "$@"