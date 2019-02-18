#!/bin/bash
#owner Blake Russo 
#script to automate scping of files from current node to other nodes listed in /etc/gridhosts (except the source node)
#requires file named /etc/gridhosts created as list of node hostnames. Hostname must be in format that $HOSTNAME variable is to skip the localhost.


if [ -f "/etc/gridhosts" ]
    then
       for x in `cat /etc/gridhosts | grep -v $HOSTNAME`; do scp $1 $x:$2 ; done
    else
        echo
        echo "ERROR: /etc/gridhosts NOT FOUND!"
        echo "A list of hosts to ssh to is required, please create /etc/gridhosts file"
        echo "Unable to scp file."
fi
