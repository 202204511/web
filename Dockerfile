FROM ubuntu:latest

# Update Ubuntu package lists
RUN apt-get update

# Install Python 3 and pip
RUN apt-get install -y python3 python3-pip
RUN apt-get install -y libjpeg-dev zlib1g-dev
RUN pip3 install Pillow
RUN pip3 install -U setuptools

# Set working directory
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any necessary Python packages
RUN pip3 install -r requirements.txt

# Expose port 8000 for Django
EXPOSE 8000

# Start the Django server
CMD ["python3", "manage.py", "runserver", "0.0.0.0:8000"]