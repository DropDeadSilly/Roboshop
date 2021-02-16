#!/bin/bash

COMPONENT=user

source components/common.sh

Print "Installing NodeJS package" "yum install nodejs make gcc-c++ -y"
yum install nodejs make gcc-c++ -y
Stat $?

Print "Downloading User content" 'Download URL'
curl -s -L -o /tmp/user.zip "https://dev.azure.com/DevOps-Batches/f635c088-1047-40e8-8c29-2e3b05a38010/_apis/git/repositories/8cd1d535-7b52-4823-9003-7b52db898c08/items?path=%2F&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true"
Stat $?

Print "Validating & Adding User - Roboshop" "useradd roboshop"
id roboshop || useradd roboshop
Stat $?

Print "Extract User component zip" "rm -rf /home/roboshop/user && mkdir -p /home/roboshop/user && cd /home/roboshop/user && unzip /tmp/user.zip"
rm -rf /home/roboshop/user && mkdir -p /home/roboshop/user && cd /home/roboshop/user && unzip /tmp/user.zip
Stat $?

Print "Install NodeJS Dependencies" "npm install"
npm install --unsafe-perm
Stat $?

chown roboshop:roboshop /home/roboshop -R

Print "Update SystemD script for User" "sed -i -e 's/MONGO_ENDPOINT/mongodb-ss.dropdeadsilly.xyz/' -e 's/REDIS_DNSNAME/redis-ss.dropdeadsilly.xyz/' /home/roboshop/user/systemd.service && mv /home/roboshop/user/systemd.service /etc/systemd/system/user.service"
sed -i -e 's/MONGO_ENDPOINT/mongodb-ss.dropdeadsilly.xyz/' -e 's/REDIS_DNSNAME/redis-ss.dropdeadsilly.xyz/' /home/roboshop/user/systemd.service && mv /home/roboshop/user/systemd.service /etc/systemd/system/user.service
Stat $?

Print "Start User Service" "systemctl daemon-reload && systemctl restart user && systemctl enable user"
systemctl daemon-reload && systemctl restart user && systemctl enable user
Stat $?