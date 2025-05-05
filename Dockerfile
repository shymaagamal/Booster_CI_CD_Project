# Step 1: Use the official Python image as the base image
FROM python:3.8-slim

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy the requirements file into the container
COPY requirements.txt /app/

# Step 4: Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Copy the entire project into the container
COPY . /app/

# Step 6: Expose the port the app will run on
EXPOSE 8000

# Step 7: Set the environment variable to indicate we're in a production environment
ENV PYTHONUNBUFFERED 1

# Step 8: Run the Django app (or run your preferred command to start the app)
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
