DefaultRoot ~

<Anonymous ~ftp>
 User ftp
 Group nogroup
 UserAlias anonymous ftp
 DirFakeUser on ftp
 DirFakeGroup on ftp
 RequireValidShell off
 MaxClients 10
 DisplayLogin welcom.msg
 DisplayChdir .message
 <Directory *>
  <Limit WRITE>
   DenyAll
  </Limit>
 </Directory>
</Anonymous>

LoadModule mod_tls.c

<IfModule mod_tls.c>
TLSEngine on
TLSLog /var/log/proftpd/tls.log
TLSProtocol SSLv23
TLSRSACertificateFile /etc/ssl/certs/proftpd.crt
TLSRSACertificateKeyFile /etc/ssl/private/proftpd.key
TLSVerifyClient off
</IfModule>
