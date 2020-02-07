#!/bin/bash
#################################################################################################
# Licensed Materials - Property of IBM
# (c) Copyright IBM Corporation 2019. All Rights Reserved.
#
# Note to U.S. Government Users Restricted Rights:
# Use, duplication or disclosure restricted by GSA ADP Schedule
# Contract with IBM Corp.
#
#################################################################################################

MINIMUM_MAJOR_DOCKER_LEVEL=18

function check_docker() {
    echo "Checking for docker installation..."
    docker_version=`docker -v`
    if [[ $? -eq 0 ]]; then
        echo $docker_version
        if [[ "$docker_version" =~ ([0-9]+).([0-9]+) ]]; then
            echo "Docker major version is ${BASH_REMATCH[1]}";
            echo "Docker minor level version is ${BASH_REMATCH[2]}";
            if [ "${BASH_REMATCH[1]}" -ge "$MINIMUM_MAJOR_DOCKER_LEVEL" ]; then
                echo "Minimum docker requirement level satisfied";
            else
                echo "Minimum major docker level is $MINIMUM_MAJOR_DOCKER_LEVEL but you have ${BASH_REMATCH[1]}; please upgrade your version of docker";
                exit
            fi
        else
            echo "Cannot determine docker level"
        fi
    else
        echo "No docker detected; you must have docker to install Augmented Data Explorer"
        exit
    fi
}

function check_docker_compose() {
    echo "Checking for docker-compose installation..."
    docker_compose_version=`docker-compose -v`
    if [[ $? -eq 0 ]]; then
        echo $docker_compose_version
        if [[ "$docker_compose_version" =~ ([0-9]+).([0-9]+) ]]; then
            echo "Docker-compose major level version is ${BASH_REMATCH[1]}";
            echo "Docker-compose minor level version is ${BASH_REMATCH[2]}";
        else
            echo "Cannot determine docker-compose level"
        fi
    else
        echo "No docker-compose detected; you must have docker-compose to install Augmented Data Explorer"
        exit
    fi
    if [ -f "docker-compose.yml" ]; then
        echo "docker-compose.yml detected"
    else
        echo "docker-compose.yml file must exist in same directory; exiting"
        exit
    fi
}

source .env
check_docker
check_docker_compose
echo "Logging into bluemix docker registry..."
docker login -u iamapikey -p -ULP5-rAigLspxfEeTijFnlRyOidzTgfm-nixieWXyik $REPOSITORY 
docker-compose pull
docker-compose -p compose up -d
if [[ $? -eq 0 ]]; then
    echo "Product started successfully.  Please open a browser to your machine and go to port $PORT.  For first time users, username and password are admin/password; for security, please change your password immediately"
else
    echo "There was a problem starting docker-compose"
fi
