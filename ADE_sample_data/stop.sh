#!/bin/bash
docker-compose -p compose down 
if [[ $? -eq 0 ]]; then
    echo "Product stopped successfully."
else
    echo "There was a problem stopping ADE with docker-compose"
fi
