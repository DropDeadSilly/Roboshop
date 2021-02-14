#!/bin/bash

### Validate the script is executed as root or not.
USER_ID=$(id -u)

set -e

if [ "$USER_ID" -ne 0 ]; then
  echo -e "\e[1;31mYou must be root users to execute this script\e[0m"
  exit 1
fi

### Printing Syntax with Linux based format
#Print () {
#  echo -e "\e[1m $(date +%c) \e[35m $(hostname) \e[0m \e[1,31m ${COMPONENT} \e[0m :: $1"
#}

### Printing Syntax with Maven based format
Print () {
  echo -e "\n\e[1,34m [INFO] \e[0m-------------------------< \e[1m $1 \e[0m >-------------------------"
  echo -e "\e[1,34m [INFO] \e[0m \e[1m $2 \e[0m"
  echo -e "\e[1,34m [INFO] \e[0m--------------------------------------------------"
}

### Status Function
Stat () {
  echo -e "\n\e[1,34m [INFO] \e[0m--------------------------------------------------"
  if [ $1 -eq 0 ]; then
    echo -e "\e[1,34m [INFO] \e[1;32m [SUCCESS] \e[0m"
  else
    echo -e "\e[1,34m [INFO] \e[1;31m [FAILURE] \e[0m"
  fi
  echo -e "\e[1,34m [INFO] \e[0m--------------------------------------------------\n"
}
