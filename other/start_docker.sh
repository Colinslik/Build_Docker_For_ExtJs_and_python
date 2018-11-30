#!/bin/sh

# Create data container
ls | grep pda-docker | xargs docker load -i
docker inspect pda-data > /dev/null 2>&1
if [ $? -eq 1 ]
then
    docker volume create pda-data
fi

# Start containers
docker run -d --privileged --name='pda' --env "PDA_CONSOLE_PORT=8345" --net=host --volume pda-data:/opt/prophetstor/pda/var prophetservice/pda

echo
echo "=========================================================================="
docker ps | grep prophetservice/pda
