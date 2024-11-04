#!/bin/bash
clear

echo "What category would you like to view?"
sleep 1
echo ""
echo "System Monitoring (a)"
echo "View logs with JournalCTL (b)"
read category

if [ "$category" != "a" ] && [ "$category" != "b" ]; then
echo "Invalid Input"
echo "Choose a new  category"
sleep 1

echo "What category would you like to view?"
sleep 1
echo ""
echo "System Monitoring (a)"

read category

fi

if [ "$category" = "a" ]; then
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
                echo ""
                echo ""
                echo ""

elif [ "$redo" == "2" ]; then
                df -h
		echo ""
                echo ""
                echo ""

elif [ "$redo" == "3" ]; then
                free -h
		echo ""
		echo ""
		echo ""
		
elif [ "$redo" != "1" ] && [ "$redo" != "2" ] && [ "$redo" != "3" ]; then
	echo "invalid input" 
fi

done
fi

if [ "$category" == "b" ]; then

fi
