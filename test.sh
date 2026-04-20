#!/bin/sh
   
    exec &> /etc/motd
    #
    #
    # Time of day
    HOUR=$(date +"%H")1234567ggffff
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
    # System + Memory
    SYS_LOADS=`cat /proc/loadavg | awk '{print $1}'`
    MEMORY_USED=`free -b | grep Mem | awk '{print $3/$2 * 100.0}'`
    SWAP_USED=`free -b | grep Swap | awk '{print $3/$2 * 100.0}'`
    NUM_PROCS=`ps aux | wc -l`
    IPADDRESS=`hostname --all-ip-addresses`
    #
    echo  "================================================================="
    echo  " Good $TIME !                              NETOLOY Corp Ltd."
    echo  "================================================================="
    echo  " - Hostname      : `hostname -f`"
    echo  " - IP Address    : $IPADDRESS"
    echo  " - Release       : $(lsb_release -s -d)[$(cat /etc/debian_version)]"
    echo  " - Kernel        : `uname -a | awk '{print $1" "$3" "$12}'`"
    echo  " - Users         : Currently `users | wc -w` user(s) logged on"
    echo  " - Server Time   : `date`"
    echo  " - System load   : $SYS_LOADS / $NUM_PROCS processes running"
    echo  " - Memory used % : $MEMORY_USED"
    echo $tcLtG " - Swap used %   : $SWAP_USED"
    echo $tcLtG " - System uptime : $upDays days $upHours hours $upMins minutes"
    echo $tcDkG "================================================================="
    echo $tcRESET ""
    #
