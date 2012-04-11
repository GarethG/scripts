#!/bin/bash

#Gracefully borrowed from @alexsleat

echo "************************"
echo "** Essentials install **"
echo "************************"


if [ "$(whoami)" != "root" ]; then
	echo "ERROR: You must be root"
	echo "Exiting"
	exit 1
fi

echo "Installing git"
sudo apt-get install git-core git-gui git-doc
DIRECTORY="/.ssh"

if [ -d "$DIRECTORY" ]; then
    	# Control will enter here if $DIRECTORY exists
	echo "SSH keys already exist, making backups in ~/.ssh/key_backup"

	mkdir key_backup
	cp id_rsa* key_backup
	rm id_rsa*

fi

echo "Enter email address:"

read EMAILADDR

#Generate new keys
ssh-keygen -t rsa -C $EMAILADDR
#Open the file for pasting into github "“Account Settings” > Click “SSH Public Keys” > Click “Add another public key”"
gedit ~/.ssh/id_rsa.pub
#Check it's been setup
ssh -T git@github.com

echo "Enter first name (space) second name:"

read FIRSTNAME LASTNAME

#Setup github details
git config --global user.name "$FIRSTNAME $LASTNAME"
git config --global user.email "$EMAILADDR"

echo "Enter github username:"

read GITUSER

echo "Enter github token:"

read GITTOKEN

git config --global github.user $GITUSER
git config --global github.token $GITTOKEN

echo "Git Setup done!"

echo "Other essentials"
sudo apt-get install kile chromium-browser


