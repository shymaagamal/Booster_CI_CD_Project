# Use Ubuntu as base image
FROM ubuntu:20.04

# Prevent prompts during package installation
ARG DEBIAN_FRONTEND=noninteractive

# Install dependencies and Python 3.6 with venv support from deadsnakes PPA
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y python3.6 python3.6-pip python3.6-venv curl git && \
    apt-get clean

# Set working directory
WORKDIR /app

# Copy the application code into the container
COPY . .

# Install Python dependencies
RUN pip3 install --upgrade pip && \
    pip3 install -r requirements.txt

# Expose port for Django application
EXPOSE 8000

# Run the Django commands and start the server
CMD python3.6 manage.py makemigrations && \
    python3.6 manage.py migrate && \
    python3.6 manage.py runserver 0.0.0.0:8000
