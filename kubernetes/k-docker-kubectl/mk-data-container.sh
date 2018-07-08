#!/usr/bin/env sh

WORKDIR="$1"

if [ -z $WORKDIR ]; then
    WORKDIR='.'
fi

cd $WORKDIR
echo "FROM debian:jessie\n\nVOLUME [ '/data' ]\n\nCOPY * /data/" > ./Dockerfile.data-container
docker rm kubectl-data
docker build -f ./Dockerfile.data-container -t temp/data .
docker run --name kubectl-data temp/data
rm ./Dockerfile.data-container