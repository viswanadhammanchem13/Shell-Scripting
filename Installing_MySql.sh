#!/bin/bash

USERID=$(id -u)

if [ "$USERID" -ne 0 ]; then
    echo "You do not have root access. Please run this script as root."
    exit 1
else
    echo "You have root access. Proceeding to install MySQL Agent..."
fi

dnf install mysql -y
if [ $? -eq 0 ]
then
   echo "Installed MySql...Success"
else
   echo "MySql Installation is failed"
   exit 1
fi
