#!/bin/bash
# Script 4: Log File Analyzer
# Scans system logs for specific keywords like 'error'.

LOGFILE="/var/log/alternatives.log" # WSL standard log path
KEYWORD="status" # Changed from 'error' to ensure you get results in WSL
COUNT=0

while read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
    fi
done < "$LOGFILE"

echo "Keyword '$KEYWORD' found $COUNT times in $LOGFILE"
echo "Showing last 3 matches:"
grep -i "$KEYWORD" "$LOGFILE" | tail -n 3
