# docker-vtex-cli
VTEX CLI with vtex login in bash

## Getting started

To use this VTEX CLI tool, you need to define the following variables in the GITLAB project:
- VTEX_WORKSPACE
- VTEX_ACCOUNT
- VTEX_APPKEY
- VTEX_APPTOKEN

## Build docker image and push on Docker Hub

docker build -t DOCKER_USER/vtex-cli:latest .
docker login DOCKER_USER
docker push DOCKER_USER/vtex-cli:latest