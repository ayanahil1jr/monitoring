#!/bin/bash
clear

while true; do
    category=$(whiptail --title "System Monitoring Script" --menu "Choose a category:" 15 60 6 \
        "a" "System Monitoring" \
        "b" "View logs with JournalCTL" \
        "c" "Upgrade Services" \
        "d" "Table of Contents" \
        "e" "Exit" 3>&1 1>&2 2>&3)

if [ $? -ne 0 ] || [ "$category" == "e" ]; then
    exit 0
fi

case $category in
    "a")
        while true; do
            input=$(whiptail --title "System Monitoring" --menu "Select an option:" 15 60 4 \
                "1" "CPU and memory usage" \
                "2" "Available space" \
                "3" "Available memory" \
                "0" "Back to main menu" 3>&1 1>&2 2>&3)
            if [ "$input" == "0" ] || [ $? -ne 0 ]; then break; fi

                case $input in
                    "1") htop ;;
                    "2") df -h | less ;;
                    "3") free -h ;;
                    *) whiptail --msgbox "Invalid choice." 10 60 ;;
                esac
        done
        ;;
    "b")
        while true; do
            input=$(whiptail --title "View Logs" --menu "Select an option:" 15 60 4 \
                "1" "All logs" \
                "2" "Logs in real time" \
                "3" "Logs for a specific service" \
                "0" "Back to main menu" 3>&1 1>&2 2>&3)

                # Back to main menu
                if [ "$input" == "0" ] || [ $? -ne 0 ]; then break; fi

                case $input in
                    "1") journalctl | less ;;
                    "2") journalctl -f ;;
                    "3")
                        service=$(whiptail --inputbox "Enter the service name (e.g., ssh.service):" 10 60 3>&1 1>&2 2>&3)
                        if [ "$service" != "" ]; then
                            journalctl -u "$service" | less
                        fi
                        ;;
                    *) whiptail --msgbox "Invalid choice." 10 60 ;;
                esac
        done
        ;;

    "c")
        input=$(whiptail --title "Upgrade Services" --menu "Select an upgrade type:" 15 60 3 \
            "1" "Upgrade all installed packages" \
            "2" "Full upgrade (changes dependencies)" \
            "0" "Back to main menu" 3>&1 1>&2 2>&3)
        case $input in
            "1") sudo apt update && sudo apt upgrade ;;
            "2") sudo apt update && sudo apt full-upgrade ;;
            "0") ;;
            *) whiptail --msgbox "Invalid choice." 10 60 ;;
        esac
        ;;
    "d")
        whiptail --title "Table of Contents" --msgbox "I) System Monitoring\n   1. CPU and Memory usage\n   2. Available space\n   3. Available memory\n\nII) View Logs\n   1. All logs\n   2. Logs in real time\n   3. Logs for a specific service\n\nIII) Upgrade Services\n   1. Upgrade all packages\n   2. Full upgrade" 20 60
        ;;
    esac
done