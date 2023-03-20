#!/bin/bash

if [ ! $UID -eq 0 ]; then
    echo 'superuser required'
    exit;
fi

# firewalld rich rule assisting script
# 
# 1st arg  : zone (default 'public')
# 2nd arg  : ip address
# 3rd arg  : port
# 4th args : tcp/udp
# 5th args : accept/reject

zone=${1:-'public'}

if [[ -z $2 || -z $3 || -z $4 || -z $5 ]]; then
    echo "Querying Firewall List..."
else
    firewall-cmd --permanent --zone=$zone --add-rich-rule="rule family=\"ipv4\" source address=\"$2\" port port=\"$3\" protocol=\"$4\" $5"
    firewall-cmd --reload
fi

firewall-cmd --list-all
