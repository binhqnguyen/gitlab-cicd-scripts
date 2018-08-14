#!/bin/bash

if [ $? -ne 3 ]; then
    echo "Usage: <docker-image, eg, alpine:latest> <url, eg, https://gitlab.naas.aws.charterlab.com/> <--registration-token, eg ...Zg3U5z...>"
    exit 1
fi

os=$(uname)
config="/srv"
if [ "$os" == "Darwin" ]; then
    config="/Users/Shared"
fi

docker stop gitlab-runner
docker rm gitlab-runner
docker run -d --name gitlab-runner --restart always \
  -v $config/gitlab-runner/config:/etc/gitlab-runner \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $(pwd)/certs/:/etc/ssl/certs/ \
  gitlab/gitlab-runner:latest

docker exec -it gitlab-runner gitlab-runner register \
  --non-interactive \
  --executor "docker" \
  --docker-image $1 \
  --url "$2" \
  --registration-token "$3" \
  --description "docker-runner" \
  --tag-list "docker,aws" \
  --run-untagged \
  --locked="false"

exit 0
