#!/bin/sh
exec &> /etc/motd
    #
    #
    # Time of day
    HOUR=$(date +"%H")
    if [ $HOUR -lt 12  -a $HOUR -ge 0 ]; then TIME="morning"
    elif [ $HOUR -lt 17 -a $HOUR -ge 12 ]; then TIME="afternoon"
    else TIME="evening"
    fi
    #
    # System uptime
    uptime=`cat /proc/uptime | cut -f1 -d.`
    upDays=$((uptime/60/60/24))
    upHours=$((uptime/60/60%24))
    upMins=$((uptime/60%60))
    #
