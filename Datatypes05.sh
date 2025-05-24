#!/bin/bash

Number1="Manchem Viswanadham" #Var1 and due to Space it's not considering.throwing error. For smooth exceution remove the space
Number2=200 #Var2
Time_Taken=$(date) #Date command executed and result will store in Time_Taken Variabel
echo "Script executed at $Time_Taken" #printing the Variabe
Sum=$(($Number1+$Number2)) #Sum Variabel executed and result will store in Sum Variabel
echo "Sum of two digits is=$Sum" #Printing the Sum