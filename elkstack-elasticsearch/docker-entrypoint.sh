#!/bin/bash

set -e

# Make sure ulimit is set appropriately
ulimit -n 64000

# Run original entry point script
/docker-entrypoint.sh $@