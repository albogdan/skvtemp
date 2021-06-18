#!/bin/bash
cd /home/ec2-user/skule-vote/skule_vote
gunicorn skule_vote.wsgi:application --bind 0.0.0.0:80 --workers 5 --capture-output --access-logfile - --error-logfile -