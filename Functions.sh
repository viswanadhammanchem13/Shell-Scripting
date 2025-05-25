#!/bin/bash

USERID=$(id -u) #Checks userId

if [ "$USERID" -ne 0 ]; then
    echo "You do not have root access. Please run this script as root."
    exit 1
else
    echo "You have root access. Proceeding to install MySQL Agent..."
fi
Validate(){
    if [ $? -eq 0 ]
   then
      echo "Installed MySql...Success"
   else
      echo "MySql Installation is failed"
      exit 1
    fi
}
dnf list installed mysql #Checks MySQL Installed or not, $? Should be equal to zero then only My Sql Installation is succussful
if [ $? -ne 0 ] #If $? Not equal to Zero then it will install SQL
then
   echo " My Sql is not installed-----Going to install"
   dnf install mysql -y #Install My Sql
   Validate $? "MySql"  
else
   echo " My Sql Already Installed"
   exit 1
fi
dnf list installed Python3 #Checks MySQL Installed or not, $? Should be equal to zero then only My Sql Installation is succussful
if [ $? -ne 0 ] #If $? Not equal to Zero then it will install SQL
then
   echo " Python3 is not installed-----Going to install"
   dnf install Python -y #Install My Sql
   Validate $? "Python3"  
else
   echo " Python3 Already Installed"
   exit 1
fi
dnf list installed nginx #Checks MySQL Installed or not, $? Should be equal to zero then only My Sql Installation is succussful
if [ $? -ne 0 ] #If $? Not equal to Zero then it will install SQL
then
   echo " nginx is not installed-----Going to install"
   dnf install nginx -y #Install My Sql
   Validate $? "nginx"  
else
   echo " nginx Already Installed"
   exit 1
fi