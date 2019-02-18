#!/bin/bash
#Owner : Blake Russo 
#Requires list of hosts in file named /etc/gridhosts.

if [ -f "/etc/gridhosts" ]
    then
        for x in `cat /etc/gridhosts | grep -v $HOSTNAME `; do ssh $x $1 ; done
    else
        echo
        echo "ERROR: /etc/gridhosts NOT FOUND!"
        echo "A list of hosts to ssh to is required, please create /etc/gridhosts file"
fi

