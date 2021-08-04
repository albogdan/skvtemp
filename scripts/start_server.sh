#!/bin/bash

cp /ENV_VARS /home/ec2-user/skule-vote/deployment
docker-compose -f deployment/docker-compose.prod.yml build
docker-compose -f deployment/docker-compose.prod.yml up -d
rm /home/ec2-user/skule-vote/deployment/ENV_VARS