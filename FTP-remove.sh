#!/bin/bash
#remove every packages from proftpd
sudo apt-get autoremove proftpd-*

#remove config folder
sudo rm -rf /etc/proftpd

#remove module folder
sudo rm -rf /usr/lib/proftpd

#remove auto generated certificate
sudo rm /etc/ssl/private/proftpd.key
sudo rm /etc/ssl/certs/proftpd.crt
