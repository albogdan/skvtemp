#!/bin/bash
echo "Starting install"
cd /home/ec2-user/skule-vote/skule_vote

echo "Creating virtualenv"
virtualenv venv
source venv/bin/activate
echo "Installing requirements"
pip3 install -r requirements.txt

echo "Sourcing env vars"
source /ENV_VARS
echo "Collecting static"
python3 manage.py collectstatic

cd frontend/ui
echo "Yarn stuff"
yarn in && yarn build

cd ..
cd ..

echo "Removing existing files"
sudo rm -r /var/www/html/*

echo "Moving frontend fiels"
sudo mv frontend/ui/build/* /var/www/html/

echo "Moving django files"
sudo mv static/* /var/www/html/static/