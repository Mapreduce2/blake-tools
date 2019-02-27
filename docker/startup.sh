#! /bin/bash
#startup script for ENTRYPOINT of SAS 9.4 container Dockerfile to launch SAS Studio Basic + spawner.

/usr/local/SASHome/SASFoundation/9.4/utilities/bin/setuid.sh
cp /etc/pam.d/system-auth /etc/pam.d/sasauth
/usr/local/SASHome/studioconfig/spawner/spawner.sh estart
/usr/local/SASHome/studioconfig/sasstudio.sh start
tail -f /dev/null
