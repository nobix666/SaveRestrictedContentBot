# Use a modern, supported version of Python and Debian
FROM python:3.11-slim-bullseye

# Create and set the working directory
WORKDIR /app

# Prevent installation prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update the system and install necessary tools (git and ffmpeg)
# python3 and pip are already included in the base image
RUN apt-get update && apt-get install -y --no-install-recommends git ffmpeg

# Copy all your project files into the container
COPY . .

# Install the Python libraries
RUN pip3 install --no-cache-dir -r requirements.txt

# The command to run when the container starts
CMD ["python3", "main.py"]
