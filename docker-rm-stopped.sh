# Remove all stopped docker containers
docker ps -a -q -f status=exited | xargs --no-run-if-empty docker rm