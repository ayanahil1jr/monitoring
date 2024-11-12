#!/bin/bash

while true; do
    category=$(whiptail --title "System Monitoring Menu" --menu "Choose an option:" 20 60 10 \
    "1" "System Monitoring" \
    "2" "View Logs with JournalCTL" \
    "3" "Upgrading Services" \
    "4" "Table of Contents" \
    "5" "Exit" 3>&1 1>&2 2>&3)

    if [ $? -ne 0 ]; then
        echo "Exiting the script."
        exit 0
    fi


    case $category in
        "1")
           
            sys_opt=$(whiptail --title "System Monitoring" --menu "Choose what to view:" 20 60 10 \
            "1" "CPU and memory usage" \
            "2" "Available space" \
            "3" "Available memory" \
            "4" "Back to Main Menu" 3>&1 1>&2 2>&3)

            case $sys_opt in
    "1") 
        htop ;;
    "2") 
        output=$(df -h)
        whiptail --title "Disk Space Usage" --msgbox "$output" 20 80 ;;
    "3") 
        output=$(free -h)
        whiptail --title "Available Memory" --msgbox "$output" 20 80 ;;
esac

            ;;
        
        "2")
      
            log_opt=$(whiptail --title "View Logs" --menu "Choose log type:" 20 60 10 \
            "1" "All logs" \
            "2" "Logs in real time" \
            "3" "Logs for a specific service" \
            "4" "Back to Main Menu" 3>&1 1>&2 2>&3)

            case $log_opt in
                "1") journalctl ;;                       
                "2") journalctl -f ;;                    
                "3")                                     
                   while true; do
    service=$(whiptail --inputbox "Enter the specific service name to view logs (or leave empty to go back):" 10 60 3>&1 1>&2 2>&3)

    if [ -z "$service" ]; then
        break
    fi

    output=$(journalctl -u "$service" --no-pager | tail -n 20)

    whiptail --title "Logs for $service" --msgbox "$output" 20 80
done


;;

                "4") continue ;;                         
            esac
            ;;

        "3")
            
            upgrade_opt=$(whiptail --title "Upgrading Services" --menu "Choose upgrade type:" 20 60 10 \
            "1" "Upgrade all installed packages" \
            "2" "Full upgrade (changes dependencies)" \
            "3" "Back to Main Menu" 3>&1 1>&2 2>&3)

            case $upgrade_opt in
                "1") sudo apt update && sudo apt upgrade ;;
                "2") sudo apt update && sudo apt full-upgrade ;;
                "3") continue ;;                         
            esac
            ;;

        "4")
            whiptail --title "Table of Contents" --msgbox "I) System Monitoring\n   1. CPU and Memory usage\n   2. Available space\n   3. Available memory\n\nII) View Logs with JournalCTL\n   1. All Logs\n   2. Logs in Real time\n   3. Logs for a specific service\n\nIII) Upgrading Services\n   1. Upgrade all installed packages\n   2. Full Upgrade all packages (changes dependencies)\n\nPress OK to go back." 20 60
            ;;

        "5") 
            echo "Exiting..."
            exit 0
            ;;
    esac
done
