#!/bin/bash

# CPU and RAM usage in real-time
echo "Monitoring CPU & RAM - Press CTRL+C to stop"

# Catch termination signal and display exit message
trap "echo -e '\nScript stopped. Have a great day!'; exit" SIGINT

while true; do
    clear
    echo "---- Monitoring ----"
    
    # CPU Usage
    echo "🔹 CPU Usage:"
    if command -v top &> /dev/null; then
        top -bn1 | grep "Cpu(s)" | awk '{print "  Usage: "$2"% user, "$4"% system, "$8"% idle"}'
    else
        echo "  top command not found. Please install the 'procps' package."
    fi
    
    # RAM Usage
    echo -e "\n🔹 RAM Usage:"
    if command -v free &> /dev/null; then
        free -m | awk 'NR==2{printf "  Total: %sMB, Used: %sMB, Free: %sMB\n", $2, $3, $4}'
    else
        echo "  free command not found. Please install the 'coreutils' package."
    fi
    
    sleep 1  # Wait 1 second before refreshing
done
