#!/bin/bash

# Advanced Nmap Scanning Tool
# Created by Sworup Kumar Sahu

clear

# Check if user is root
if [[ $EUID -ne 0 ]]; then
   echo -e "\033[1;91m\n[!] Nmap Scanner must be run as root. Aborting...\n\033[1;m"
   exit 1
fi

# Associative array for common ports
declare -A port_names=(
    [21]="FTP"
    [22]="SSH"
    [23]="Telnet"
    [25]="SMTP"
    [53]="DNS"
    [80]="HTTP"
    [110]="POP3"
    [143]="IMAP"
    [443]="HTTPS"
    [3306]="MySQL"
    [3389]="RDP"
)

# Function to display banner
banner() {
    echo -e "\033[1;92m"
    echo "=============================="
    echo "   Advanced Nmap Scanner"
    echo "=============================="
    echo "  Made by Sworup Kumar Sahu"
    echo "=============================="
    echo -e "\033[1;m"
}

# Function to install requirements
install_requirements() {
    echo "Installing requirements..."
    sudo apt-get update
    sudo apt-get install -y nmap
}

# Function to perform quick scan
quick_scan() {
    local target=$1
    local ports=$2
    echo "Performing Quick Scan on ports: $ports..."
    nmap -T4 -F -p $ports $target -oN quick_scan.log
    echo "Quick Scan completed. Results saved to quick_scan.log"
}

# Function to perform full scan
full_scan() {
    local target=$1
    local ports=$2
    echo "Performing Full Scan on ports: $ports..."
    nmap -T4 -A -v -p $ports $target -oN full_scan.log
    echo "Full Scan completed. Results saved to full_scan.log"
}

# Function to perform stealth scan
stealth_scan() {
    local target=$1
    local ports=$2
    echo "Performing Stealth Scan on ports: $ports..."
    nmap -sS -p $ports $target -oN stealth_scan.log
    echo "Stealth Scan completed. Results saved to stealth_scan.log"
}

# Function to perform OS detection
os_detection() {
    local target=$1
    local ports=$2
    echo "Performing OS Detection on ports: $ports..."
    nmap -O -p $ports $target -oN os_detection.log
    echo "OS Detection completed. Results saved to os_detection.log"
}

# Function to perform version detection scan
version_detection() {
    local target=$1
    local ports=$2
    echo "Performing Version Detection Scan on ports: $ports..."
    nmap -sV -p $ports $target -oN version_detection.log
    echo "Version Detection Scan completed. Results saved to version_detection.log"
}

# Function to perform UDP scan
udp_scan() {
    local target=$1
    local ports=$2
    echo "Performing UDP Scan on ports: $ports..."
    nmap -sU -p $ports $target -oN udp_scan.log
    echo "UDP Scan completed. Results saved to udp_scan.log"
}

# Function to perform intense scan
intense_scan() {
    local target=$1
    local ports=$2
    echo "Performing Intense Scan on ports: $ports..."
    nmap -T4 -A -v -p $ports $target -oN intense_scan.log
    echo "Intense Scan completed. Results saved to intense_scan.log"
}

# Function to perform all scans
complete_scan() {
    local target=$1
    local ports=$2
    echo "Performing Complete Scan on ports: $ports..."

    quick_scan $target $ports
    full_scan $target $ports
    stealth_scan $target $ports
    os_detection $target $ports
    version_detection $target $ports
    udp_scan $target $ports
    intense_scan $target $ports

    echo "Complete Scan completed. All results saved to respective log files."
}

# Function to display port names and numbers
display_ports() {
    echo "Port Number   Port Name"
    echo "======================"
    for port in "${!port_names[@]}"; do
        printf "%-13s %s\n" "$port" "${port_names[$port]}"
    done
    echo "======================"
}

# Main script execution
banner

install_requirements

echo "Enter the target IP or domain:"
read target

echo -e "\nSelect scan type:"
echo "1. Quick Scan"
echo "2. Full Scan"
echo "3. Stealth Scan"
echo "4. OS Detection"
echo "5. Version Detection Scan"
echo "6. UDP Scan"
echo "7. Intense Scan"
echo "8. Complete Scan (All scans)"

read -p "Choice: " choice

echo "Enter ports to scan (e.g., 80,443 or 1-65535):"
read ports

case $choice in
    1)
        quick_scan $target $ports
        ;;
    2)
        full_scan $target $ports
        ;;
    3)
        stealth_scan $target $ports
        ;;
    4)
        os_detection $target $ports
        ;;
    5)
        version_detection $target $ports
        ;;
    6)
        udp_scan $target $ports
        ;;
    7)
        intense_scan $target $ports
        ;;
    8)
        complete_scan $target $ports
        ;;
    *)
        echo "Invalid choice"
        ;;
esac

echo "Scan completed."

