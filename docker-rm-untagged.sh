# Remove all untagged docker images
docker ps -a | tail -n +2 | awk '$2 ~ "^[0-9a-f]+$" {print $'1'}' | xargs --no-run-if-empty docker rm