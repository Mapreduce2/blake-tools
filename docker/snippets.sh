#!/bin/bash

#snippets frequently used in Dockerfile

#set user password script without being prompted
#single line
useradd centos:centos
echo "changeit" | passwd ""centos"" --stdin

#script
adduser "$1"
echo "$2" | passwd "$1" --stdin

#or via perl 

#!/usr/bin/perl -w
open my $pipe, '|chpasswd' or die "can't open pipe: $!";
print {$pipe} "$username:$password";
close $pipe

