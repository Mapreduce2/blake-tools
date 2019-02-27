#!/bin/bash
#script to automate running of common initial docker images such as a registry and similar basics to get started.

 docker pull registry
 docker run -dit -p 5000:5000 --name registry registry
 
 mkdir -p /certs
 openssl req -newkey rsa:4096 -nodes -sha256 -keyout /certs/ca.key -x509 -days 365 -out /certs/ca.crt
 #make sure to add fqdn above.
 
 #start secure docker registry (self signed cert) - secondard port as well in case you want both.
 docker run -d -p 5001:5000 --restart=always --name secure-registry \
-v /certs:/certs \
-e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/ca.crt \
-e REGISTRY_HTTP_TLS_KEY=/certs/ca.key \
registry
 
 #let docker registry through firewalld
 
 firewall-cmd --permanent --add-port=5000/tcp
 firewall-cmd --reload
   
