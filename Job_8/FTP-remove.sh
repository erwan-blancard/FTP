#!/bin/bash
#remove every packages from proftpd
sudo apt-get autoremove -y proftpd-*

#remove config folder
sudo rm -rf /etc/proftpd

#remove module folder
sudo rm -rf /usr/lib/proftpd

#remove anonymous folder
sudo rm -rf /srv/ftp

#remove auto generated certificate
sudo rm /etc/ssl/private/proftpd.key
sudo rm /etc/ssl/certs/proftpd.crt
