#!/bin/bash
clear
echo "What would you like to view?"
sleep 1
echo "CPU and memory usage"
echo "Available space"
echo "Available memory"

read input
clear
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
