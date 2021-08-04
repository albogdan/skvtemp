#!/bin/bash
cd /home/ec2-user/skule-vote/skule_vote
docker-compose -f deployment/docker-compose.prod.yml down
sudo rm -r /var/www/html/*

virtualenv venv
source venv/bin/activate
sudo pip install -r requirements.txt

cd frontend/ui
yarn in && yarn build
sudo mv build/* /var/www/html/

cd ../..

echo "Location"
pwd
echo "Files"
ls -la

python manage.py collectstatic
sudo mv static/* /var/www/html/static/