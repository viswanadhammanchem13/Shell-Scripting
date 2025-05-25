#!/bin/bash

USERID=$(id -u) #Checks userId

if [ "$USERID" -ne 0 ]; then
    echo "You do not have root access. Please run this script as root."
    exit 1
else
    echo "You have root access. Proceeding to install MySQL Agent..."
fi
# Function Defination
Validate(){ # Takes the i/p from Exit status,what command they tried to install
    if [ $1 -eq 0 ]
   then
      echo "Installed $2...Success"
   else
      echo "$2 Installation is failed"
    fi
}

dnf list installed mysql #Checks MySQL Installed or not, $? Should be equal to zero then only My Sql Installation is succussful
if [ $? -ne 0 ] #If $? Not equal to Zero then it will install SQL
then
   echo " My Sql is not installed-----Going to install"
   dnf install mysql -y #Install My Sql
   Validate $? "MySql" # Function calling 
else
   echo " My Sql Already Installed"
fi

dnf list installed python3 #Checks python3 Installed or not, $? Should be equal to zero then only python3 Installation is succussful
if [ $? -ne 0 ] #If $? Not equal to Zero then it will install python3
then
   echo " python3 is not installed-----Going to install"
   dnf install python3 -y #Install python3
   Validate $? "python3" # Function calling  
else
   echo " python3 Already Installed"
fi

dnf list installed nginx #Checks nginx Installed or not, $? Should be equal to zero then only nginx Installation is succussful
if [ $? -ne 0 ] #If $? Not equal to Zero then it will install nginx
then
   echo " nginx is not installed-----Going to install"
   dnf install nginx -y #Install nginx
   Validate $? "nginx"  # Function calling  
else
   echo " nginx Already Installed"
fi