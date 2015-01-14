# Remove all untagged docker images
docker images -a | grep "^<none>" | awk '{print $3}' | xargs --no-run-if-empty docker rmi