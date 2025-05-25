#!/bin/bash

USERID=$(id -u)
if [ $USERID -ne 0 ]
then
    echo "You Don't Have Root Access"
    exit 1 # If it's don't have root access
else
    echo "You have Root have Access to install My Sql Agent"   
fi