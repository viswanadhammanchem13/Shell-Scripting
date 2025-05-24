#!/bin/bash

Time_Taken=$(date)
echo "Script executed at $Time_Taken"
Movie=("Court" "HIT3" "Puspha2" "Thandel")
echo "First Movie of: ${Movie[0]}" #${} We saying to consider as whole varabel
echo "third Movie of: ${Movie[3]}"
echo "All Movies of: ${Movie[@]}"
echo "Fifth Movie of: ${Movie[5]}" # It will the O/P as blank