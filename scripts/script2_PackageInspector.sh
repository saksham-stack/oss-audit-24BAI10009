#!/bin/bash
# Script 2: FOSS Package Inspector
# Checks if Git is installed and explains its philosophy.

PACKAGE="git"

if dpkg -l $PACKAGE &>/dev/null; then
    echo "$PACKAGE is installed on this system."
    dpkg -s $PACKAGE | grep -E 'Version|License|Description'
else
    echo "$PACKAGE is NOT found."
fi

# Case statement for philosophy [cite: 141]
case $PACKAGE in
    git) echo "Git Philosophy: Distributed control ensures no single point of failure." ;;
    *) echo "Open source promotes community collaboration." ;;
esac
