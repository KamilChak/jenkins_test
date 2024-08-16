#!/bin/bash

. env/bin/activate

cd /var/jenkins_home/workspace/my-pipeline/

python3 manage.py makemigrations
python3 manage.py migrate

echo "migrations finished"

