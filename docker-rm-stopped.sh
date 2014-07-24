# Remove all stopped docker containers
docker rm $(docker ps -a -q)