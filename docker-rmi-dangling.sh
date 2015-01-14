# Remove all untagged docker images
docker images -q -f dangling=true | xargs --no-run-if-empty docker rmi