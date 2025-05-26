#!/bin/bash

USERID=$(id -u) #Checks userId
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[om"

if [ "$USERID" -ne 0 ]; then
    echo -e " $R You do not have root access. Please run this script as root.$N"
    exit 1
else
    echo -e "$Y You have root access. Proceeding to install Package... $N"
fi
# Function Defination
Validate(){ # Takes the i/p from Exit status,what command they tried to install
    if [ $1 -eq 0 ]
   then
      echo -e "Installed $2... $G Success $N"
   else
      echo  -e "$2 $R Installation is failed $N"
    fi
}

dnf list installed mysql #Checks MySQL Installed or not, $? Should be equal to zero then only My Sql Installation is succussful
if [ $? -ne 0 ] #If $? Not equal to Zero then it will install SQL
then
   echo -e  " $Y My Sql is not installed-----Going to install$N"
   dnf install mysql -y #Install My Sql
   Validate $? "MySql" # Function calling 
else
   echo -e " $Y My Sql Already Installed $N"
fi

dnf list installed python3 #Checks python3 Installed or not, $? Should be equal to zero then only python3 Installation is succussful
if [ $? -ne 0 ] #If $? Not equal to Zero then it will install python3
then
   echo -e " $Y python3 is not installed-----Going to install $N"
   dnf install python3 -y #Install python3
   Validate $? "python3" # Function calling  
else
   echo-e " $Y python3 Already Installed $N"
fi

dnf list installed nginx #Checks nginx Installed or not, $? Should be equal to zero then only nginx Installation is succussful
if [ $? -ne 0 ] #If $? Not equal to Zero then it will install nginx
then
   echo-e  " $Y nginx is not installed-----Going to install $N"
   dnf install nginx -y #Install nginx
   Validate $? "nginx"  # Function calling  
else
   echo -e "$Y nginx Already Installed $N"
fi