#!/bin/bash

# superuser!

apt-get && apt-get upgrade -y

apt-get install htop mc screen sudo jq git bc net-tools wget curl exim4

# No day without pony
cp ../artifacts/motd /etc/motd

cp ../artifacts/resolv.conf /etc/resolv.conf

# Interactive for now
adduser kolo

dpkg-reconfigure exim4-config

#nano /etc/resolv.conf
#nano /etc/sudoers
#nano /etc/ssh/sshd_config
#nano /etc/exim4/passwd.client



# ....blank....
