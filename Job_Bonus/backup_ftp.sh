#!/bin/bash

time=$(date +"%d-%m-%y_%H:%M")
archive="backup_${time}.tar.gz"

tar -zcvf "/var/tmp/${archive}" "/etc/proftpd" "/srv/ftp" "/ftpshare"	#create archive with all ftp users directories + anonymous directory and config files

#requires the public key to be in the "authorized_keys" file of the target machine to be automatic
scp "/var/tmp/${archive}" erwan@192.168.19.130:"/backup/$archive" && rm "/var/tmp/${archive}"
