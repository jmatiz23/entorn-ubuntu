#!/bin/bash

docker-compose down
docker-compose up -d
sleep 2
docker ps -a | grep nginx
