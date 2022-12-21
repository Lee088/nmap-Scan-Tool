#!/bin/bash

# Define the network range to scan
network="192.168.1.0/24"

# Scan the network for open ports and save the results to a file
nmap -p- $network -oN ports.txt || {
  echo "Failed to scan for open ports." >&2
  exit 1
}

# Scan the network for vulnerabilities and save the results to a file
nmap --script vuln $network -oN vulnerabilities.txt || {
  echo "Failed to scan for vulnerabilities." >&2
  exit 1
}

echo "Scan complete."
