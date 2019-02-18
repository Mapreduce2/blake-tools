#!/bin/bash
#Blake Russo
#script to remove restrictions set on $HOME/.ssh/authorized_keys for ssh password-less rsa key login. Useful for cloud providers like AWS/OpenStack that restrict rsa key login to specific users.

whoami
echo $HOME/
ls -la $HOME/.ssh

cd $HOME/.ssh

echo "Existing Authorized Keys configuration." 
cat authorized_keys

echo "Backing up to $HOME/.ssh/authorized_keys.orig"
cp authorized_keys authorized_keys.orig
echo "done " $?

echo "Removing restrictions and keeping only starting from ssh-rsa .... and creating $HOME/.ssh/authorized_keys.new"
cat $HOME/.ssh/authorized_keys | cut -d" " -f14-15 > $HOME/.ssh/authorized_keys.new

echo "replacing $HOME/.ssh/authorized_keys with $HOME/.ssh/authorized_keys.new"
mv authorized_keys.new authorized_keys;cat authorized_keys

echo "updated $HOME/.ssh/authorized_keys"
cat $HOME/.ssh/authorized_keys
#setting permissions to 600. 
chmod 600 $HOME/.ssh/authorized_keys*
