# To export the private key from the pfx file:
openssl pkcs12 -in mycert.pfx -nocerts -out my_cert.key

# And now remove the key password:
openssl rsa -in key.pem -out localhost.key



# To export the certificate from the pfx file: 1 certificate for your host, CN should = hostname.
openssl pkcs12 -in my_cert.pfx -clcerts -nokeys -out localhost.crt

#create cacerts / server-chain with 2 certificates (root + int)
openssl pkcs12 -in my.pfx -cacerts -nokeys -chain | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > server-chain.crt

#alts

openssl pkcs12 -in <filename.pfx> -nocerts -nodes | sed -ne '/-BEGIN PRIVATE KEY-/,/-END PRIVATE KEY-/p' > <clientcert.key>
openssl pkcs12 -in <filename.pfx> -clcerts -nokeys | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > <clientcert.cer>
