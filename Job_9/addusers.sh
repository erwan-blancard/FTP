#!/bin/bash

cd /home/erwan/FTP/Job_9/

while IFS="," read -r ID NAME LNAME MDP GROUP
do

if [ ! $ID == "Id" ]; then

	NAME="${NAME} ${LNAME}"
	GROUP="${GROUP//$'\r'/}"		#removes return character (\r) from string GROUP

       	if [ $GROUP == "User" ]; then
       	       echo "Creating user: ${NAME} with ID ${ID}, MDP ${MDP}, GROUP ${GROUP}"
       	       sudo useradd --non-unique --badnames -u $ID -p $(openssl passwd -1 $MDP) -d "/ftpshare/${NAME}" "${NAME}"
       	       mkdir "/ftpshare/${NAME}"
       	       sudo chown "${NAME}" "/ftpshare/${NAME}"
       	       sudo chgrp "${NAME}" "/ftpshare/${NAME}"

       	elif [ $GROUP == "Admin" ]; then
       	       echo "Creating admin: ${NAME} with ID ${ID}, MDP ${MDP}, GROUP ${GROUP}"
       	       sudo useradd --non-unique --badnames -u $ID -G sudo -p $(openssl passwd -1 $MDP) -d "/ftpshare/${NAME}" "${NAME}"
       	       mkdir "/ftpshare/${NAME}"
       	       sudo chown "${NAME}" "/ftpshare/${NAME}"
       	       sudo chgrp "${NAME}" "/ftpshare/${NAME}"

       	else
       	       echo "User's role is invalid !"
       	fi
fi

done < <(grep "" users.csv)			#fixes last line skip
