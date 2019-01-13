#!/bin/bash
while :
do
    date_time=$(date "+%A, %b %d %Y %T")
    battery=$(acpi -b | sed "s/Battery 0: //")
    cpu=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}' | cut -c-4)
    brightness=$(($(brightnessctl g)*88/100000))
    volume=$(pactl list sinks | grep '^[[:space:]]Volume:' | \head -n $(( $SINK + 1 )) | tail -n 1 | sed -e 's,.* \([0-9][0-9]*\)%.*,\1,')
    echo "CPU: $cpu%       Volume: $volume%         $brightness%         $battery         $date_time       "
    sleep 1
done