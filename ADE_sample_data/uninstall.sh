#!/bin/bash
docker-compose -p compose down --rmi all
if [[ $? -eq 0 ]]; then
    echo "ADE images removed successfully."
else
    echo "There was a problem removing ADE images with docker-compose"
fi
