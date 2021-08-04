#!/bin/bash
cd /home/ec2-user/skule-vote/skule_vote
docker-compose -f deployment/docker-compose.prod.yml down
sudo rm -r /var/www/html/*

sudo pip3 install -r requirements.txt

cd frontend/ui
yarn in && yarn build
sudo mv build/* /var/www/html/

cd ../..
python manage.py collectstatic
sudo mv static/* /var/www/html/static/