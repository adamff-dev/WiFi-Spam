function coolexit()
{
clear
ifconfig $AD down
macchanger -p $AD
iwconfig $AD mode managed
ifconfig $AD up
clear
echo -e "\e[1;31mThanks for using this script"
echo -e "Made by BlueArduino20"
exit
}

echo -e "\e[1;32m     #    ######            ######                                     "
echo -e "    # #   #     #  ####     #     # ######   ##    ####   ####  #    # "
echo -e "   #   #  #     # #         #     # #       #  #  #    # #    # ##   # "
echo -e "  #     # ######   ####     ######  #####  #    # #      #    # # #  # "
echo -e "  ####### #            #    #     # #      ###### #      #    # #  # # "
echo -e "  #     # #       #    #    #     # #      #    # #    # #    # #   ## "
echo -e "  #     # #        ####     ######  ###### #    #  ####   ####  #    # "
echo " "
echo -e "\e[1;37m                                                     By BlueArduino20  "
echo " "
ifconfig
echo -n -e "\e[1;34mType your wireless adapter name > "
read AD
clear
echo -n -e "Do you want to use the default dictionary (1000 APs)? y/n > "
read DD
clear
if [ $DD == n ]; then
	echo -n -e "Type the name of your own dictionary > "
	read OWN
	clear
	echo -e "Ok. If you want to stop the process, press CTRL+C"
	echo -e "\e[37m"
	trap coolexit EXIT
	sleep 1
	ifconfig $AD down
	macchanger -r $AD
	iwconfig $AD mode monitor
	ifconfig $AD up
	mdk3 $AD b -f ./$OWN -a -s 1000
else
	clear
	echo -e "Ok. If you want to stop the process, press CTRL+C"
	echo -e "\e[37m"
	trap coolexit EXIT
	sleep 1
	ifconfig $AD down
	macchanger -r $AD
	iwconfig $AD mode monitor
	ifconfig $AD up
	mdk3 $AD b -f ./SSID_List.txt -a -s 1000
	trap exit EXIT
fi

