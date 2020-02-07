#################################################################################################
# Licensed Materials - Property of IBM
# (c) Copyright IBM Corporation 2019. All Rights Reserved.
#
# Note to U.S. Government Users Restricted Rights:
# Use, duplication or disclosure restricted by GSA ADP Schedule
# Contract with IBM Corp.
#
#################################################################################################
#!/bin/bash
container_name=`docker ps | grep ade_backend | awk -F " " '{print $NF}'`
# Check if container_name is empty
if [ -z "$container_name" ]; then
    echo "Cannot find ADE backend container; please check that ADE containers are running"
    exit
fi
docker exec -w /backend/utils -it ${container_name} python3 load_sample_data.pyc
