#!/bin/bash
cd /home/ec2-user/skule-vote/skule_vote

virtualenv venv
source venv/bin/activate
pip3 install -r requirements.txt

source /ENV_VARS
python3 manage.py collectstatic

cd frontend/ui
yarn in && yarn build

cd ..
cd ..
sudo rm -r /var/www/html/*
sudo mv frontend/ui/build/* /var/www/html/
sudo mv static/* /var/www/html/static/