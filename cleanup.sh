#!/bin/sh
CURR_TIME=$(date)
echo "Starting clean up at $CURR_TIME"
SECONDS=0

# Deleting container processes
DOCKER_PROCS=$(($(docker ps -a -q|wc -l) - 0 ))
echo "Deleting $DOCKER_PROCS processes"
if [ $DOCKER_PROCS -gt 0 ] 
then
  docker rm $(docker ps -a -q)
fi

DOCKER_IMAGE_COUNT_WITH_HEADER=$(docker images -a |wc -l)
DOCKER_IMAGE_COUNT=$(($DOCKER_IMAGE_COUNT_WITH_HEADER - 1)) 

echo "Deleting $DOCKER_IMAGE_COUNT docker images"
if [ $DOCKER_IMAGE_COUNT -gt 0 ]
then
  docker rmi -f $(docker images -a -q)
fi

