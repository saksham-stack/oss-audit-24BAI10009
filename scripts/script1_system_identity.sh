#!/bin/bash
# Script 1: System Identity Report
# Author: Saksham Gupta
# This script displays OS and user details using command substitution.

echo "===== Open Source Audit ====="
echo "Student: Saksham Gupta"
echo "Software: Git"
echo "============================="
echo "Kernel: $(uname -r)"
echo "User: $(whoami)"
echo "Home: $HOME"
echo "Uptime: $(uptime -p)"
echo "Date: $(date)"
echo "License: This OS (Ubuntu/Linux) is released under the GNU GPL."
