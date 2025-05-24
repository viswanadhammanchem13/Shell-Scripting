#!/bin/bash

echo "All Varaibles passed to the script is:$@"
echo "Number of Variables Passed:$#"
echo "Current Script Name:$0"
echo "Present Working Directory:$PWD"
echo "Home Directory:$Home"
echo "Which User is running:$USER"
echo "PID of the current Script:$$"
sleep 10 &
echo "PID of the last command running in background:$!"
echo "The exit status of the last command:$?"