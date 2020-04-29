# Demonstration on how to compile MongoDB 4.4 RCx

## Synopsis
This demonstration installs MongoDB 4.4 release candidate on Ubuntu 20.04 (focal)
* Restore this repo
* Open a terminal window / command prompt
* Change to the directory containing the restored repo
* The `install_mongodb.sh` script loosely follows the procedure outlined here: https://docs.mongodb.com/master/tutorial/install-mongodb-on-ubuntu/
* There are no repo files (yet) for Ubuntu 20.04 (focal), so continue to use _bionic_.
* Prerequisite packages:
  * `wget`
  * `gnupg`
  * `systemd` (not required, but useful to start `mongod` as a service)
* Add this to your `/etc/apt/sources.list` to gain access to the release candidate source code:
```
deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/testing multiverse
```
* Build a Docker image and spin up a container using either of the following:

## Using Docker Compose (easier)
* Install docker and docker-compose
* Spin up the image in detached mode:
```
docker-compose up -d
```
* Shell into the container:
```
docker exec -it phpcl-mongodb-4-4 /bin/bash
```

## Using Docker (harder)
* Build the image using docker
```
docker build -t phpcl/mongodb_4_4 ./docker
```
* Run the image in detached mode:
```
docker run -t -d -p "27111:27010" -h "demo" -v `pwd`:/srv/repo phpcl/mongodb_4_4
```
* Find the container ID:
```
docker container ls
```
* Shell into the container:
```
docker exec -it CONTAINER_ID /bin/bash
```

## Install MongoDB
* Shell into the container (see above)
* Run the install script:
```
cd /srv/repo
./install_mongodb.sh
```
