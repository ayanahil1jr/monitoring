#!/bin/bash
clear
echo "What would you like to view?"
sleep 1
echo "CPU and memory usage (1)"
echo "Available space (2)"
echo "Available memory (3)"

read input
if [ "$input" != "1" ] && [ "$input" != "2" ] && [ "$input" != "3" ]; then
echo "invalid input"
sleep 1
echo "CPU and memory usage"
echo "Available space"
echo "Available memory"
read input
fi

if [ "$input" == "1" ]; then
htop
elif [ "$input" == "2" ]; then
df -h
elif [ "$input" == "3" ]; then
free -h
fi
sleep 1
echo ""
echo ""
echo ""
while true; do
echo "click Enter to escape or choose another option"
sleep 1
echo "CPU and memory usage (1)"
echo "Available space (2)"
echo "Available memory (3)"

read redo
clear
if [ "$redo" == "" ]; then
	exit 0
elif [ "$redo" == "1" ]; then
                htop
elif [ "$redo" == "2" ]; then
                df -h
elif [ "$redo" == "3" ]; then
                free -h
elif [ "$redo" != "1" ] && [ "$redo" != "2" ] && [ "$redo" != "3" ]; then
	echo "invalid input" 
fi

done
