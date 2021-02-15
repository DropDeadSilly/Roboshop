#!/bin/bash

COMPONENT=redis

source components/common.sh

Print "Install Redis Repos" "yum install epel-release yum-utils -y && # yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y"
yum install epel-release yum-utils -y
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
Stat $?

Print "Enabling Redis Repos" "yum-config-manager --enable remi && yum install redis -y"
yum-config-manager --enable remi && yum install redis -y
Stat $?

Print "Update Redis Config" "sed -i -e 's/127.0.0.1/0.0.0.0' /etc/redis.conf"
sed -i -e 's/127.0.0.1/0.0.0.0' /etc/redis.conf
Stat $?

Print "Restarting Redis service" "systemctl enable redis && systemctl restart redis"
systemctl enable redis && systemctl restart redis
Stat $?