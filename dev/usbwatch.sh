#!/bin/bash
# Logs camera presence/absence transitions. Run in a spare terminal.
LOG=~/captures/usbwatch.log
mkdir -p ~/captures
prev=""
while true; do
    if lsusb | grep -qi "0661:1416"; then cur="present"; else cur="ABSENT"; fi
    if [ "$cur" != "$prev" ]; then
        echo "$(date '+%F %T')  $cur" | tee -a "$LOG"
        prev="$cur"
    fi
    sleep 1
done
