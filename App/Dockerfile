# Use an official Python runtime as the base image
FROM python:3.8-slim

# Set the working directory in the container
WORKDIR /app

# Copy the local code and requirements to the container
COPY app.py /app/
COPY requirements.txt /app/

# Install any needed packages
RUN pip install -r requirements.txt

# Expose the port the app runs on
EXPOSE 5000

# Define the command to run your application
CMD ["python", "app.py"]
