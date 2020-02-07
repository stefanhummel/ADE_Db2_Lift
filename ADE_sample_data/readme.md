# Getting started with Db2 Augmented Data Explorer

## Pre-requisites

- Docker (or Docker Desktop for Mac), minimum version 18
- docker-compose, minimum version 1.16
- Recommended system requirements: 8 GB of RAM, 4 CPU
- We also recommend that at least 4 GB of RAM be allocated to Docker, and 4 CPU's.
- Network connectivity to our Docker repo, which is located at registry.ng.bluemix.net on port 443. This connectivity is only necessary for first-time install (statup.sh) and can be removed later.

## Installation

As of beta version 0.9.0, we have replaced the electron-based installer app with a simple bash script for Linux and Mac.
To install Db2 Augmented Data Explorer:

- Execute `install.sh` from the command line. This script will login to our docker repository, pull the containers to your machine, and then start the containers in daemon mode.
- Bring up a browser to http://<your_machine>:5000 , where <your_machine> is the IP or DNS of your server. If you installed locally on your laptop, this can be localhost, e.g. http://localhost:5000

## Note for Linux users

Depending on your system settings, more virtual memory may be required to run Elasticsearch. Please talk to your system administrator. More details here:
https://www.elastic.co/guide/en/elasticsearch/reference/current/vm-max-map-count.html
A temporary fix is to run `sysctl -w vm.max_map_count=262144` as root. You can do this before running `install.sh` or if you have already installed, just restart the containers with `start.sh`. A more permanent solution requires changes to `/etc/sysctl.conf`.

## Network connectivity

If the script hangs on "Logging into bluemix docker registry...", please check with your network administrator to make sure that you have outgoing connectivity access to registry.ng.bluemix.net on port 443 from your enterprise. You can verify connectivity (or lack thereof) with curl using a command like: `curl registry.ng.bluemix.net:443 --connect-timeout 5`

## Starting and stopping the containers

After this initial install, ADE can be brought up and down with `docker-compose -p compose up -d` and `docker-compose -p compose up -d` or the helper scripts `start.sh` and `stop.sh`. Please note that these commands must be issued from the same directory as the `docker-compose.yml file` (e.g. this directory where you are reading this readme).

## Authentication

When you login for the first time with your web browser, the default user is `admin` and the password is `password`. After your first login, please change this password immediately for security purposes.

## Changing the port

The default port is 5000. If you would like to use a different port, please edit the .env file and change the port to a different value, then you will need to start or restart docker with `docker-compose -p compose up -d` or `start.sh`.

## Sample Data

As of beta version 0.9.0, we no longer include the Db2 Express container for the sample data. If you had crawled sample data that is still in your cache, please crawl again.

You can still obtain the sample data in your own database. To do so, execute the `load_sample_data.sh` script from the command line while ADE containers are running. Please note that you will need to define a connection first in ADE, as the script will connect to an ADE connection to load the data. It will prompt you to login with your ADE admin user and password, and from there you can select one of your ADE connections to load the data into.

## Logs

You can pull the docker logs with the `getlogs.sh` script. It will pipe to standard out. If you wish to save to a file, you can do so with this command: `./getlogs.sh > logs.txt`

## Additional Help

More help is available through the product Help page and at this link:
http://getade.mybluemix.net/help
