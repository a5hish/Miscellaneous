#!/bin/bash
#######################################
# Script_name	: cp_to_all.sh
# Version	: 1.1v
# Description	: Copies an file/folder to other computers connected in the 
#		  local network.
# Requirement	: Debian-Os (Ubuntu*), All computer connected on a single network, 
#		  username/Ip having a sequence.
# 
# Author	: undefined.
########################################

# install the given packages if not pre-installed.
sudo dpkg-query -l openssh-server 1>/dev/null || sudo apt install openssh-server -y 
sudo dpkg-query -l net-tools 1>/dev/null || sudo apt install net-tools -y
sudo dpkg-query -l sshpass 1>/dev/null || sudo apt install sshpass

# if no argument (path_to_file/folder) specificed exit.
[ -z $1 ] && exit

# Specify the ip addr range of the connected computer in the for loop.
# default 1-10 (192.168.8.1 - 192.168.8.10)
# change this range as per needed.
for i in {1..10};
do
	# user names of the Pc's
	username="dbms0"$i

	# password Pc's
	password="rgit123"
	
	# network Ip of Pc's
	Ip="192.168.8."$i

	# copy .
	sshpass -p "$password" scp  $1 $username@$Ip: 2>/dev/null
done



