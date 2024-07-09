# Advanced-Nmap-Scanning-Tool
This Bash script provides an advanced Nmap scanning tool with various scan options, designed to automate and simplify network reconnaissance tasks.
# Features
Quick Scan
Full Scan
Stealth Scan
OS Detection
Version Detection Scan
UDP Scan
Intense Scan
Complete Scan (All scans)
Prerequisites
Linux environment
Root privileges (sudo)
# Installation
Clone the repository:


Copy code
```
git clone https://github.com/sworup1999/Advanced-Nmap-Scanning-Tool.git
```
```
cd advanced-nmap-scanner
```
Ensure nmap is installed:


Copy code
```
sudo apt-get update
```
```
sudo apt-get install nmap
```
Usage
Run the script as root:


Copy code
```
sudo ./advanced-nmap-scanner.sh
```
Follow the prompts to select the scan type and enter the target IP or domain along with ports to scan.

Examples
Perform a Quick Scan on ports 80 and 443:


Copy code
sudo ./advanced-nmap-scanner.sh
Perform a Complete Scan (All scans) on all ports:


Copy code
sudo ./advanced-nmap-scanner.sh

# Author
Sworup Kumar Sahu - @sworup1999
# Acknowledgments
Thanks to the creators and contributors of Nmap for their powerful network scanning tool.
