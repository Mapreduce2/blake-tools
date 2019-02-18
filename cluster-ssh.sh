#!/bin/bash
#owner Blake Russo TUM (blruss)
#requires creation of hostlist /etc/gridhosts. 
if [ -f "/etc/gridhosts" ]
    then
       for x in `cat /etc/gridhosts`; do scp $1 $x:$2 ; done
    else
        echo
        echo "ERROR: /etc/gridhosts NOT FOUND!"
        echo "A list of hosts to ssh to is required, please create /etc/gridhosts file"
        echo "Unable to scp file."
fi
