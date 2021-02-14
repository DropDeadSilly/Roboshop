#!/bin/bash

### Validate the script is executed as root or not.
USER_ID=$(id -u)

set -e

if [ "$USER_ID" -ne 0 ]; then
  echo -e "\e[1;31mYou must be root users to execute this script\e[0m"
  exit 1
fi

###
Print () {
  echo -e "\e[1m $(date +%c) \e[35m $(hostname) \e[0m \e[1,31m ${COMPONENT} :: $1"
}