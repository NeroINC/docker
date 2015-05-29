#!/bin/bash

set -e

# Add logstash as command if needed
if [[ "$1" == -* ]]; then
	set -- logstash "$@"
fi

# Run as user "logstash" if the command is "logstash"
if [ "$1" == logstash ]; then
	# Change the ownership of /usr/share/logstash/data to logstash
	chown -R logstash:logstash /usr/share/logstash/data
	set -- gosu logstash "$@"
fi

echo "Starting Logstash"
exec "$@"