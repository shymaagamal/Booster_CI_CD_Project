# Step 1: Use Ubuntu as base image
FROM ubuntu:20.04

# Step 2: Set environment variables to skip interactive prompts during package installs
ENV DEBIAN_FRONTEND=noninteractive

# Step 3: Update Ubuntu and install Python, pip, and other dependencies
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-dev build-essential libpq-dev curl && \
    apt-get clean

# Step 4: Set the working directory
WORKDIR /app

# Step 5: Copy and install Python dependencies
COPY requirements.txt /app/
RUN pip3 install --no-cache-dir -r requirements.txt

# Step 6: Copy the full project into the container
COPY . /app/

# Step 7: Expose the port the Django app will run on
EXPOSE 8000

# Step 8: Set environment variable to prevent output buffering
ENV PYTHONUNBUFFERED=1

# Step 9: Run Django development server
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]
