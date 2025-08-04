#!/bin/bash

# Script to list all mounted disks in Conky format
for mount in $(lsblk -o MOUNTPOINT | grep -v '^$'); do
    if [ -d "$mount" ]; then
        used=$(df -h "$mount" | awk 'NR==2 {print $3}')
        size=$(df -h "$mount" | awk 'NR==2 {print $2}')
        perc=$(df -h "$mount" | awk 'NR==2 {print $5}' | tr -d '%')
        bar=$(printf "%-${perc}s" "#" | tr ' ' '-')
        echo "${mount}: ${used} / ${size} (${perc}%) [${bar}]"
    fi
done
