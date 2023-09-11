#!/bin/bash

# Check if docker-compose is installed
if ! command -v docker-compose &> /dev/null
then
    echo "docker-compose is not installed. Please install it and try again."
    exit 1
fi

# Run docker-compose to start the services
docker-compose -f docker/docker-compose.yml up --build -d

# Check if running docker-compose was successful
if [ $? -ne 0 ]
then
    ynh_die "Error starting Docker Compose services."
fi

echo "Docker Compose services started successfully."