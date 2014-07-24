# Remove docker containers that are a week old
docker ps -a | grep 'weeks ago' | awk '{print $1}' | xargs docker rm