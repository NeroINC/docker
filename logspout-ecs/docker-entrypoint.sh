#!/bin/sh

set -e

# Use Amazon instance's hostname for logging
export SYSLOG_HOSTNAME=`wget -q -O - http://169.254.169.254/latest/meta-data/instance-id`

# Run original entry point script
exec "$@"
