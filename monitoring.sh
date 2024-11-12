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
echo "Table Of Contents (d)"
read category
if [ "$category" == "" ]; then
	exit 0
fi
	
if [ "$category" != "a" ] && [ "$category" != "b" ] && [ "$category" != "c" ] && [ "$category" != "d" ]; then
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
    echo "Upgrade all installed packages (1)"
    echo "Full Upgrade all installed packages. (WARNING: changes dependencies) (2)"
    read input
    if [ "$input" == "0" ]; then
        ./monitoring.sh
        exit 0
    fi
    if [ "$input" == "" ]; then
        exit 0
    fi
    if [ "$input" != "1" ] && [ "$input" && "2" ]; then
        echo "Invalid input. Try again."
        sleep 2
        clear
        echo "Choose the type of upgrade"
        echo ""
        echo "Upgrade all packages (1)"
        echo "Full Upgrade all installed packages. (WARNING: changes dependencies) (2)"
        read input
    fi
    if [ "$input" == "1" ]; then
        sudo apt update
        sudo apt upgrade
    fi
    if [ "&input" == "2" ]; then
        sudo apt update
        sudo at full-upgrade
    fi


fi

clear
if [ "$category" == "d" ]; then
    echo "I) System Monitoring"
    echo "   1. CPU and Memory usage"
    echo "   2. Available space"
    echo "   3. Available memory"
    echo "II) View Logs with JournalCTL"
    echo "   1. All Logs"
    echo "   2. Logs in Real time"
    echo "   3. Logs for a specific service"
    echo "III) Upgrading Services"
    echo "   1. Upgrade all installed packages"
    echo "   2. Full Upgrade all packages. (Changes dependencies)"
    echo ""
    echo "Press Enter to go back"
    read leave
    if [ "$leave" == "" ]; then
        ./monitoring.sh
        exit 0
    fi
fi

echo "Would you like to do other operations?"
echo ""
echo "yes"
echo "no"

read redo

if [ "$redo" == "yes" ]; then
    ./monitoring.sh
    exit 0
fi

if [ "$redo" == "no" ]; then
    exit 0
fi

if [ "$redo" != "yes" ] && [ "$redo" != "no" ]; then
   echo "Invalid input"
   sleep 1
   clear
   echo "Would you like to do other operations?"
   echo ""
   echo "yes"
   echo "no"
fi