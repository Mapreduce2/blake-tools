#!/bin/bash
#install docker compose

sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose


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

#cleanup kubernetes pods that failed

kubectl get pods | grep CrashLoopBackOff | awk '{print $1}' | xargs kubectl delete pod

kubectl get pods --show-all=true

kubectl get po -a --all-namespaces -o json | \
jq  '.items[] | select(.status.reason!=null) | select(.status.reason | contains("Evicted")) | 
"kubectl delete po \(.metadata.name) -n \(.metadata.namespace)"' | xargs -n 1 bash -c

#change auth method for SAS 9.4 + viya from pam to/from pw via script

sed -i 's/methods=pam/methods=pw/g' /usr/local/SASHome/SASFoundation/9.4/utilities/bin/sasauth.conf


#misc



kubectl get deployments
kubectl get deployments
kubectl expose deployment naga-k8s-test-viya --type=NodePort
kubectl describe pods  naga-k8s-test-viya-84cf659988-ptmjc
kubectl get services
kubectl get pods
kubectl run --image=destiny.unx.sas.com:5000/tsad-sasawb-centrify-working:v1 --port=8081
kubectl run --image=destiny.unx.sas.com:5000/tsad-sasawb-centrify-working:v1 naga-k8s-test-viya  --port=80
kubectl describe pods  naga-k8s-test-viya-84cf659988-ptmjc

openssl pkcs12 -in docker-certificate-keystore.pfx | sed -ne '/-BEGIN PRIVATE KEY-/,/-END PRIVATE KEY-/p' > /etc/pki/tls/private/localhost.key
openssl pkcs12 -in  docker-certificate-keystore.pfx -clcerts -nokeys | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' >  /etc/pki/tls/certs/localhost.crt
openssl pkcs12 -in <filename.pfx> -cacerts -nokeys -chain | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /etc/pki/tls/certs/chain.pem



openssl pkcs12 -in docker-certificate-keystore.pfx -cacerts -nokeys -chain | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > /etc/pki/tls/certs/chain.pem
Enter Import Password:
MAC verified OK
 ls -la localhost.crt

ls -la chain.pem

s -la ../private/localhost.key
../private/localhost.key

docker --tlsverify --tlscacert=/etc/pki/tls/certs/ca.pem \
--tlscert=/etc/pki/tls/certs/localhost.pem\
--tlskey=/etc/pki/tls/private/key.pem \
-H=$HOST:2376 versin
