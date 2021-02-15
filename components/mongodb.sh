#!/bin/bash

COMPONENT=mongodb

source components/common.sh

Print "Setup MongoDB Repo" "Downlaod URL --XXX--"
echo '[mongodb-org-4.2]
name=MongoDB Repository
baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/4.2/x86_64/
gpgcheck=1
enabled=1
gpgkey=https://www.mongodb.org/static/pgp/server-4.2.asc' >/etc/yum.repos.d/mongodb.repo
Stat $?

Print "Installing MongoDB" "yum install -y mongodb-org"
yum install -y mongodb-org
Stat $?

Print "Enabling MongoDB" "systemctl enable mongod"
systemctl enable mongod
Stat $?

Print "Startoing MongoDB" "systemctl start mongod"
systemctl start mongod
Stat $?

Print "Update MongoDB Config" "SED command"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
Stat $?

Print "Restarting MongoDB" "systemctl restart mongod"
systemctl restart mongod
Stat $?

Print "Downloading MongoDB Schema" "Downlaod URL --XXX--"
curl -s -L -o /tmp/mongodb.zip "https://dev.azure.com/DevOps-Batches/f635c088-1047-40e8-8c29-2e3b05a38010/_apis/git/repositories/03f2af34-e227-44b8-a9f2-c26720b34942/items?path=%2F&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true"
Stat $?

Print "Extracting & Loading Mongo Schema to MongoDB" "unzip mongodb.zip && mongo < catalogue.js && mongo < users.js"
cd /tmp
unzip mongodb.zip
mongo < catalogue.js
mongo < users.js
Stat $?