#!/bin/bash

set -e


# Wait for the Elasticsearch container to be ready before starting Kibana 
# (only if linked via Docker and thus running on the same machine).
if grep -q elasticsearch "/etc/hosts"; then
	echo "Stalling for Elasticsearch (2 minutes)"
	while true; do
		timeout 1 bash -c 'cat < /dev/null > /dev/tcp/elasticsearch/9200' 2>/dev/null && break
	done
	sleep 120
fi

# Run original entry point script
/docker-entrypoint.sh $@