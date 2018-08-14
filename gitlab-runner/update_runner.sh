os=$(uname)
config="/srv"
if [ "$os" == "Darwin" ]; then
    config="/Users/Shared"
fi
docker pull gitlab/gitlab-runner:latest
docker stop gitlab-runner && docker rm gitlab-runner

