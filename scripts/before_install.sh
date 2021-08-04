#!/bin/bash
cd /home/ec2-user/skule-vote/skule_vote

virtualenv venv
source venv/bin/activate
pip3 install -r requirements.txt

python3 manage.py collectstatic

cd frontend/ui
yarn in && yarn build