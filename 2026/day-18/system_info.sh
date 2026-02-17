#!/bin/bash
set -euo pipefail

# Function: Hostname and OS info
host_os_info() {
    echo "Hostname: $(hostname)"
    echo "OS Info:"
    cat /etc/os-release | grep PRETTY_NAME
}

# Function: Uptime
uptime_info() {
    echo "Uptime:"
    uptime -p
}

# Function: Disk usage (top 5 by size)
disk_usage() {
    echo "Top 5 Disk Usage:"
    df -h | sort -k2 -h | tail -5
}

# Function: Memory usage
memory_usage() {
    echo "Memory Usage:"
    free -h
}

# Function: Top 5 CPU-consuming processes
cpu_processes() {
    echo "Top 5 CPU-consuming processes:"
    ps -eo pid,comm,%cpu --sort=-%cpu | head -6
}

# Main function
main() {
    echo "=============================="
    echo "      SYSTEM INFO REPORT      "
    echo "=============================="

    echo
    echo "---- Host & OS Info ----"
    host_os_info

    echo
    echo "---- Uptime ----"
    uptime_info

    echo
    echo "---- Disk Usage ----"
    disk_usage

    echo
    echo "---- Memory Usage ----"
    memory_usage

    echo
    echo "---- CPU Processes ----"
    cpu_processes
}

# Call main
main

