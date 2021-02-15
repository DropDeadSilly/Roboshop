#!/bin/bash

COMPONENT=Catalogue

source components/common.sh

Print "Installing NodeJS package" "yum install nodejs make gcc-c++ -y"
yum install nodejs make gcc-c++ -y
Stat $?

Print "Downloading Catalogue content" 'Download URL'
$ curl -s -L -o /tmp/catalogue.zip "https://dev.azure.com/DevOps-Batches/f635c088-1047-40e8-8c29-2e3b05a38010/_apis/git/repositories/d62914b9-61e7-4147-ab33-091f23c7efd4/items?path=%2F&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true"
Stat $?

Print "Validating & Adding User - Roboshop" "useradd roboshop"
id roboshop || useradd roboshop
Stat $?

Print "Extract Catalogue component zip" "rm -rf /home/roboshop/catalogue && mkdir -p /home/roboshop/catalogue && cd /home/roboshop/catalogue && unzip /tmp/catalogue.zip"
rm -rf /home/roboshop/catalogue && mkdir -p /home/roboshop/catalogue && cd /home/roboshop/catalogue && unzip /tmp/catalogue.zip
Stat $?

Print "Install NodeJS Dependencies" "npm install"
npm install --unsafe-perm
Stat $?

Print "Update SystemD script for Catalogue" "sed -i -e 's/MONGO_DNSNAME/mongodb-ss.dropdeadsilly.xyz/' /home/roboshop/catalogue/systemd.service && mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service"
sed -i -e 's/MONGO_DNSNAME/mongodb-ss.dropdeadsilly.xyz/' /home/roboshop/catalogue/systemd.service && mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
Stat $?

Print "Start Catalogue Service" "systemctl daemon-reload && systemctl restart catalogue && systemctl enable catalogue"
systemctl daemon-reload && systemctl restart catalogue && systemctl enable catalogue
Stat $?