#!/bin/bash

## Validate the script is executed as root or not.
USER_ID=$(id -u)

set -e

if [ "$USER_ID" -ne 0 ]; then
  echo -e "\e[31mYou must be root users to execute this script\e[0m"
  exit 1
fi