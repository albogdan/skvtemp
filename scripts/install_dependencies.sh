#!/bin/bash
cd /home/ec2-user/skule-vote/skule_vote
docker-compose -f deployment/docker-compose.prod.yml down
sudo rm -r /var/www/html/*

sudo pip3 install -r requirements.txt
python manage.py collectstatic

cd frontend/ui
yarn in && yarn build

cd ../..
sudo mv frontend/ui/build/* /var/www/html/
sudo mv static/* /var/www/html/static/
