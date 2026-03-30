#!/bin/bash
# Script 3: Disk and Permission Auditor
# Loops through system folders to check sizes and security permissions.

DIRS=("/etc" "/var/log" "/home" "/usr/bin" "/tmp")

echo "--- Directory Audit Report ---"
for DIR in "${DIRS[@]}"; do
    if [ -d "$DIR" ]; then
        # Extracting perms and size [cite: 157]
        PERMS=$(ls -ld $DIR | awk '{print $1, $3, $4}')
        SIZE=$(du -sh $DIR 2>/dev/null | cut -f1)
        echo "Location: $DIR | Perms: $PERMS | Size: $SIZE"
    fi
done
