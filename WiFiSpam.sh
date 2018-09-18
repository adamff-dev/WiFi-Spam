#!/bin/bash

function coolexit() {
clear
>nul ifconfig $AD down
>nul macchanger -p $AD
>nul iwconfig $AD mode managed
>nul ifconfig $AD up
>nul rm RANDOM_wordlist.txt
>nul nmcli device connect $AD
clear
title
echo -e "\e[1;31m   Thanks for using this script"
echo -e "   My GitHub: \e[1;37mhttps://github.com/BlueArduino20"
exit
}

function title() {
echo -e "\e[1;32m    _       ___ _______    _____                     "
echo -e "   | |     / (_) ____(_)  / ___/____  ____ _____ ___ "
echo -e "   | | /| / / / /_  / /   \\__ \\/ __ \\/ __ \`/ __ \`__ \\"
echo -e "   | |/ |/ / / __/ / /   ___/ / /_/ / /_/ / / / / / /"
echo -e "   |__/|__/_/_/   /_/   /____/ .___/\\__,_/_/ /_/ /_/"
echo -e "                            /_/                      "
echo -e "\e[1;37m                                     By BlueArduino20  "
echo " "
}

title
sleep 1
ifconfig
echo -n -e "\e[1;34mType your wireless adapter name > "
echo -e -n "\e[1;37m"
read AD
clear
title
echo -e "\e[1;34m  Choose an option:"
echo " "
echo -e "\e[1;34m  1. \e[1;37mUse the default word list (1000 APs)"
echo -e "\e[1;34m  2. \e[1;37mCreate a fast custom word list and use it"
echo -e "\e[1;34m  3. \e[1;37mUse an existent word list"
echo -e "\e[1;34m  4. \e[1;37mUse a random SSIDs word list"
echo " "
echo -n -e "\e[1;34m  > "
echo -n -e "\e[1;37m"
read DD
clear
if [ $DD == 1 ]; then
	nmcli device disconnect $AD
	clear
	title
	echo -e "\e[1;32mStarting process..."
	echo -e "If you want to stop it press CTRL+C."
	echo -e "\e[37m "
	trap coolexit EXIT
	sleep 1
	ifconfig $AD down
	macchanger -r $AD
	iwconfig $AD mode monitor
	ifconfig $AD up
	trap coolexit EXIT
	mdk3 $AD b -f ./SSID_List.txt -a -s 1000
fi
if [ $DD == 2 ]; then
	nmcli device disconnect $AD
	clear
	title
	echo -n -e "\e[1;34mWrite your string/word (Max. length: 12) > "
	echo -n -e "\e[1;37m"
	read WORD
	echo -n -e "\e[1;34mHow many SSIDs do you want? > "
	echo -n -e "\e[1;37m"
	read N
	COUNT=1
	while [ $COUNT -lt $N ] || [ $COUNT -eq $N ]; do
		echo $WORD $COUNT >> $WORD"_wordlist.txt"
		let COUNT=COUNT+1
	done
	clear
	title
	echo -e "\e[1;32mStarting process..."
	echo -e "If you want to stop it press CTRL+C."
	echo -e "\e[37m"
	trap coolexit EXIT
	sleep 1
	ifconfig $AD down
	macchanger -r $AD
	iwconfig $AD mode monitor
	ifconfig $AD up
	trap coolexit EXIT
	mdk3 $AD b -f ./$WORD"_wordlist.txt" -a -s 1000
fi
if [ $DD == 3 ]; then
	nmcli device disconnect $AD
	title
	echo -e "\e[1;37mPlease, note that your word list must have the same structure as SSID_List.txt, otherwise the process won't work."
	echo " "
	echo -n -e "\e[1;34mType the name of your own word list > "
	echo -n -e "\e[1;37m"
	read OWN
	clear
	title
	echo -e "\e[1;32mStarting process..."
	echo -e "If you want to stop it press CTRL+C."
	echo -e "\e[1;37m"
	sleep 1
	ifconfig $AD down
	macchanger -r $AD
	iwconfig $AD mode monitor
	ifconfig $AD up
	trap coolexit EXIT
	mdk3 $AD b -f ./$OWN -a -s $(wc -l $OWN | cut -f1 -d ' ')
fi
if [ $DD == 4 ]; then
	nmcli device disconnect $AD
	title
	echo -n -e "\e[1;34mHow many SSIDs do you want? > "
	echo -n -e "\e[1;37m"
	read N
	COUNT=1
	while [ $COUNT -lt $N ] || [ $COUNT -eq $N ]; do
		echo $(pwgen 14 1) >> "RANDOM_wordlist.txt"
		let COUNT=COUNT+1
	done
	clear
	title
	echo -e "\e[1;32mStarting process..."
	echo -e "If you want to stop it press CTRL+C."
	echo -e "\e[1;37m "
	sleep 1
	ifconfig $AD down
	macchanger -r $AD
	iwconfig $AD mode monitor
	ifconfig $AD up
	trap coolexit EXIT
	mdk3 $AD b -f ./RANDOM_wordlist.txt -a -s $N
fi
