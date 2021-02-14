#!/bin/bash

component=$1

if [ -z "${component}" ]; then
  echo "Need a Input of Component Name"
  exit 1
fi

aws ec2 run-instances --launch-template LaunchTemplateId=lt-0e2dc0c3d69abc55e --tag-specifications "ResourceType=instance,Tags=[{key=Name},{Value=${component}]"