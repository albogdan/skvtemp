#!/bin/bash

echo "Coping env vars"
cd /home/ec2-user/skule-vote
cp /ENV_VARS /home/ec2-user/skule-vote/deployment

echo "Building new docker container"
docker-compose -f deployment/docker-compose.prod.yml build

echo "Bringing up new docker container"
docker-compose -f deployment/docker-compose.prod.yml up -d
