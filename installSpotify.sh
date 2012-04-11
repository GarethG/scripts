#!/bin/bash

echo "*********************"
echo "** Install Spotify **"
echo "*********************"

if [ "$(whoami)" != "root" ]; then
	echo "ERROR: You must be root"
	echo "Exiting"
	exit 1
fi

echo "Adding the spotify repository"
echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list

echo "Adding public key"
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4E9CFF4E

echo "Installing"
sudo apt-get update
sudo apt-get install spotify-client-qt
