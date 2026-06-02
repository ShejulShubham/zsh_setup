#!/bin/bash

# Detect power state automatically
if [ -d "/sys/class/power_supply/AC0" ]; then
    STATUS=$(cat /sys/class/power_supply/AC0/online)
elif [ -d "/sys/class/power_supply/AC" ]; then
    STATUS=$(cat /sys/class/power_supply/AC/online)
else
    STATUS=$(cat /sys/class/power_supply/ADP1/online)
fi

if [ "$STATUS" = "1" ]; then
    zenity --info \
        --title="🔌 Power Connected" \
        --text="<span size='12pt'>Charger Connected.</span>" \
        --timeout=5 &
else
    zenity --warning \
        --title="🔋 Power Disconnected" \
        --text="<span size='12pt'>Running on battery.</span>" \
        --timeout=5 &
fi