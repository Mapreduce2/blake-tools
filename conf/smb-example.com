#example /etc/samba/smb.conf for Active Directory Domains.
[global]
   security = ads
   realm = MYREALM.EXAMPLE.COM
   workgroup = WORKGROUPNAME

   log file = /var/log/samba/%m.log

   kerberos method = secrets and keytab

   client signing = yes
   client use spnego = yes
