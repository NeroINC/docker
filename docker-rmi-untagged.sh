# Remove all untagged docker images
docker rmi $(docker images -a | grep "^<none>" | awk '{print $3}')
