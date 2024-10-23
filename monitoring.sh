#!/bin/bash
clear
echo "What would you like to view? (Case Sensitive)"
sleep 1
echo "CPU and memory usage"
echo "Available space"
echo "Available memory"

read input
if [ "$input" != "CPU and memory usage" ] && [ "$input" != "Available space" ] && [ "$input" != "Available memory" ]; then
echo "invalid input"
sleep 1
echo "CPU and memory usage"
echo "Available space"
echo "Available memory"
read input
fi

if [ "$input" == "CPU and memory usage" ]; then
htop
elif [ "$input" == "Available space" ]; then
df -h
elif [ "$input" == "Available memory" ]; then
free -h
fi
sleep 1
echo ""
echo ""
echo ""
while true; do
echo "click Enter to escape or choose another option (Case Sensitive)"
sleep 1
echo "CPU and memory usage"
echo "Available space"
echo "Available memory"

read redo
clear
if [ "$redo" == "" ]; then
	exit 0
elif [ "$redo" == "CPU and memory usage" ]; then
                htop
elif [ "$redo" == "Available space" ]; then
                df -h
elif [ "$redo" == "Available memory" ]; then
                free -h
elif [ "$redo" != "CPU and memory usage" ] && [ "$redo" != "Available space" ] && [ "$redo" != "Available memory" ]; then
	echo "invalid input" 
fi

done
