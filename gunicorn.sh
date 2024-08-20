#!/bin/bash

. env/bin/activate

cd /var/jenkins_home/workspace/my-pipeline/

python3 manage.py makemigrations
python3 manage.py migrate

echo "migrations finished"

sudo cp -rf gunicorn.socket /etc/systemd/system/
sudo cp -rf gunicorn.service /etc/systemd/system/

echo "$USER"
echo "$PWD"

sudo systemctl daemon-reload
sudo systemctl start gunicorn
sudo systemctl enable gunicorn

echo "gunicorn is Up"

sudo systemctl status gunicorn
sudo systemctl restart gunicorn