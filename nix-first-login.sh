#!/bin/bash

echo "disable selinux or set permissive mode"

#disable - require grub update - careful - wrong changes can cause system not to boot!

#sed -i 's/enforcing/disabled/g' /etc/sysconfig/selinux
#sed -i 's/console/ selinux=0 console/g'  /boot/grub/grub.conf
#permissive on boot

echo setting permissive selinux on boot in /etc/sysconfig/selinux. to disable please uncomment options and update grub.

sed -i 's/permissive/disabled/g' /etc/sysconfig/selinux

echo adjusting ssh client settings

echo diabling strict host key checking on ssh client.

echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config

echo enabling password auth since disabled for cloud accounts to make it easier.
echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config

echo enabling max startups 1000 
echo "MaxStartups 10:30:1000" >>  /etc/ssh/sshd_config

echo enabling tcp keep alive
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
echo "TCPKeepAlive yes" >>  /etc/ssh/sshd_config

#other
#GSSAPIKeyExchange no
#GSSAPIEnablek5users no

systemctl restart sshd

echo "dont forget to set user pws if needed or keys"
echo /etc/sysconfig/selinux | grep -v "#"

echo /boot/grub/grub.conf 
cat /boot/grub/grub.conf 

echo /etc/ssh/ssh_config
cat /etc/ssh/ssh_config | grep -v #" | AWK NF

echo /etc/ssh/sshd_config
cat /etc/ssh/sshd_config | grep -v "#" | AWK NF


