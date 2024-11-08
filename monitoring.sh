#!/bin/bash
clear

echo "Type 0 in any typing box to come back to this screen"
echo "Click Enter in any typing box to escape"
echo ""
echo ""
echo ""
echo "What category would you like to view?"
sleep 1
echo ""
echo "System Monitoring (a)"
echo "View logs with JournalCTL (b)"
echo "Upgrading Services (c)"
read category

if [ "$category" == "" ]; then
	exit 0
fi
	
if [ "$category" != "a" ] && [ "$category" != "b" ] && [ "$category" != "c" ]; then
    echo "Invalid Input"
    echo "Choose a new category"
    sleep 1

    echo "What category would you like to view?"
    sleep 1
    echo ""
    echo "System Monitoring (a)"
    echo "View logs with JournalCTL (b)"
    echo "Upgrading Services (c)"
    read category
    category_type=""
fi

if [ "$category" == "a" ]; then
    category_type="System Monitoring"
    echo "What would you like to view in $category_type?"
    sleep 1
    echo "CPU and memory usage (1)"
    echo "Available space (2)"
    echo "Available memory (3)"
    read input

    if [ "$input" == "" ]; then
        exit 0
    fi
    if [ "$input" == "0" ]; then
        ./monitoring.sh
        exit 0
    fi
    if [ "$input" != "1" ] && [ "$input" != "2" ] && [ "$input" != "3" ]; then
        echo "Invalid input"
        sleep 1
        echo "CPU and memory usage"
        echo "Available space"
        echo "Available memory"
        read input
        if [ "$input" == "0" ]; then
            ./monitoring.sh
            exit 0
        fi
        if [ "$input" == "" ]; then
            exit 0
        fi
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
        echo "Click Enter to escape or choose another option"
        sleep 1
        echo "CPU and memory usage (1)"
        echo "Available space (2)"
        echo "Available memory (3)"

        read redo
        if [ "$redo" == "0" ]; then
            ./monitoring.sh
            exit 0
        fi
        if [ "$redo" == "" ]; then
            exit 0
        fi
        clear
        if [ "$redo" == "1" ]; then
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
        else
            echo "Invalid input" 
        fi
    done
fi

if [ "$category" == "b" ]; then
    clear
    category_type="JournalCTL"
    echo "What logs would you like to view using $category_type?"
    sleep 1
    echo ""
    echo "All logs (1)"
    echo "Logs in real time (2)"
    echo "Logs for a specific service (3)"
    read input
    if [ "$input" == "0" ]; then
        ./monitoring.sh
        exit 0
    fi
    if [ "$input" == "" ]; then
        exit 0
    fi
    clear
    if [ "$input" != "1" ] && [ "$input" != "2" ] && [ "$input" != "3" ]; then
        echo "Invalid input. Try again"
        sleep 2
        clear
        echo "What logs would you like to view using $category_type?"
        sleep 1
        echo ""
        echo "All logs (1)"
        echo "Logs in real time (2)"
        echo "Logs for a specific service (3)"
        read input
    fi
    if [ "$input" == "1" ]; then
        journalctl
    elif [ "$input" == "2" ]; then
        journalctl -b
    elif [ "$input" == "3" ]; then
        echo "Choose a specific service"
        echo ""
        echo "Here are some examples:"
        echo ""
        echo "ssh.service"
        echo "apache2.service"
        echo "nginx.service"
        echo ""
        echo "Write out the specific service: journalctl -u <choose service>"
        read service
        if [ "$service" == "0" ]; then
            ./monitoring.sh
            exit 0
        fi
        if [ "$service" == "" ]; then
            exit 0
        fi
        journalctl -u "$service"
    fi
fi

if [ "$category" == "c" ]; then
    echo "Choose the type of upgrade"
    echo ""
    echo "Upgrade all packages (1)"
    read input
    if [ "$input" == "0" ]; then
        ./monitoring.sh
        exit 0
    fi
    if [ "$input" == "" ]; then
        exit 0
    fi
    if [ "$input" != "1" ]; then
        echo "Invalid input. Try again."
        sleep 2
        clear
        echo "Choose the type of upgrade"
        echo ""
        echo "Upgrade all packages (1)"
        read input
    fi
    if [ "$input" == "1" ]; then
        sudo apt update
        sudo apt upgrade
    fi
fi
