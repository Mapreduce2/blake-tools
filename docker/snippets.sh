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

#remove dangling failed docker images/containers

docker rmi $(docker images -q -f dangling=true)
 
#login to shell

docker exec -it container-id bash

#run container with port forwarding

docker run -d -p 8080:8080 image:tag 

#run basic web app container from k8s

kubectl run  --image=docker-image-name:tag --port=8080 k8spodname

#still must expose 
