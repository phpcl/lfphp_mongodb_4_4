#!/bin/bash
MONGODB_VER=$1
if [ $# -eq 0 ]
then
    echo 'IMPORTANT: need to run this as root'
    echo 'Usage: install_mongodb.sh <VERSION>'
    echo '       ex: install_mongodb.sh "4.4.0~rc3"'
    exit 0
fi
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add -
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.4 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-4.4.list
echo "deb [ arch=amd64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/testing multiverse" | tee -a /etc/apt/sources.list.d/mongodb-org-4.4.list
apt-get update
apt-get install -y mongodb-org=$1
mongod -f /etc/mongod.conf &
ps -ax
echo "You can now run a mongo shell ..."
