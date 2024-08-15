#!/bin/bash

if [ ! -d "env" ]; then
    echo "Creating Python virtual environment..."
    python3 -m venv env
fi

source env/bin/activate

pip install --no-cache-dir -r requirements.txt

if [ ! -d "logs" ]; then
    echo "Creating logs directory..."
    mkdir logs
    touch logs/error.log logs/access.log
fi

chmod -R 777 logs

echo "Environment setup finished."
