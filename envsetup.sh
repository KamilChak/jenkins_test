#!/bin/bash

# Check if the virtual environment directory exists
if [ ! -d "env" ]; then
    echo "Creating Python virtual environment..."
    python3 -m venv env
fi

# Activate the virtual environment
. env/bin/activate

# Install Python dependencies
pip install --no-cache-dir -r requirements.txt

# Create logs directory if it doesn't exist
if [ ! -d "logs" ]; then
    echo "Creating logs directory..."
    mkdir logs
    touch logs/error.log logs/access.log
fi

# Set permissions for logs
chmod -R 777 logs

echo "Environment setup finished."
