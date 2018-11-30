#!/bin/sh

docker stop pda
docker rm pda
echo
echo "=========================================================================="
docker ps -a | grep prophetservice/pda

docker images | grep prophetservice/pda | awk '{ print $3; }' | uniq | xargs docker rmi --force
echo
echo "=========================================================================="
docker images | grep prophetservice/pda

if [ "$1" = "all" ]
then
    docker volume rm pda-data
    echo
    echo "=========================================================================="
    docker volume ls
fi
