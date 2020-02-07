#!/bin/bash
source .env
docker-compose -p compose up -d
if [[ $? -eq 0 ]]; then
    echo "Product started successfully.  Please open a browser to your machine and go to port $PORT.  For first time users, username and password are admin/password; for security, please change your password immediately"
else
    echo "There was a problem starting ADE with docker-compose"
fi
