# Use the official Python image from the Docker Hub
FROM python:3.10-slim

# Set environment variables to prevent Python from writing .pyc files and to enable unbuffered mode
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container
WORKDIR /app

# Ensure the script is executable
RUN chmod +x envsetup.sh

# Run environment setup script
RUN ./envsetup.sh

# Copy the requirements file into the container
COPY requirements.txt /app/

# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code into the container
COPY . /app/

# Expose the port the app runs on
EXPOSE 8000

# Command to run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
# CMD ["gunicorn", "--bind", "0.0.0.0:8000", "devops.wsgi:application"]