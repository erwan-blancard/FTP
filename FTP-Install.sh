#!/bin/bash
apt-get install -y sudo

sudo apt-get -y update
sudo apt-get install -y proftpd
if [ ! $? == 0 ]; then
	echo "Cannot install package \"proftpd\". Exiting..."
	exit 1
fi

sudo apt-get install -y proftpd-mod-crypto
if [ ! $? == 0 ]; then
	echo "Cannot install package \"proftpd-mod-crypto\". Exiting..."
	exit 1
fi

sudo openssl req -x509 -newkey rsa:2048 -keyout /etc/ssl/private/proftpd.key -out /etc/ssl/certs/proftpd.crt -nodes -days 3650

sudo cp proftpd_tls.conf /etc/proftpd/conf.d
if [ ! $? == 0 ]; then
	echo "Warning: Could not copy config file to \"/etc/proftpd/conf.d\""
	exit 1
fi

sudo systemctl restart proftpd

echo "Installation successful !"