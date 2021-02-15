#!/bin/bash

COMPONENT=cart

source components/common.sh

Print "Installing NodeJS package" "yum install nodejs make gcc-c++ -y"
yum install nodejs make gcc-c++ -y
Stat $?

Print "Downloading Cart content" 'Download URL'
curl -s -L -o /tmp/cart.zip "https://dev.azure.com/DevOps-Batches/f635c088-1047-40e8-8c29-2e3b05a38010/_apis/git/repositories/f62a488c-687f-4caf-9e5e-e751cf9b1603/items?path=%2F&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true"
Stat $?

Print "Validating & Adding User - Roboshop" "useradd roboshop"
id roboshop || useradd roboshop
Stat $?

Print "Extract Cart component zip" "rm -rf /home/roboshop/cart && mkdir -p /home/roboshop/cart && cd /home/roboshop/cart && unzip /tmp/cart.zip"
rm -rf /home/roboshop/cart && mkdir -p /home/roboshop/cart && cd /home/roboshop/cart && unzip /tmp/cart.zip
Stat $?

Print "Install NodeJS Dependencies" "npm install"
npm install --unsafe-perm
Stat $?

Print "Update SystemD script for Cart" "sed -i -e 's/MONGO_DNSNAME/mongodb-ss.dropdeadsilly.xyz/' /home/roboshop/cart/systemd.service && mv /home/roboshop/cart/systemd.service /etc/systemd/system/cart.service"
sed -i -e 's//mongodb-ss.dropdeadsilly.xyz/' /home/roboshop/cart/systemd.service && mv /home/roboshop/cart/systemd.service /etc/systemd/system/cart.service
Stat $?

Print "Start Cart Service" "systemctl daemon-reload && systemctl restart cart && systemctl enable cart"
systemctl daemon-reload && systemctl restart cart && systemctl enable cart
Stat $?