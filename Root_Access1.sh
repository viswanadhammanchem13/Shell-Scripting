#!/bin/bash

USERID=$(id -u)

if [ "$USERID" -ne 0 ]; then
    echo "You do not have root access. Please run this script as root."
    exit 1
else
    echo "You have root access. Proceeding to install MySQL Agent..."
fi
