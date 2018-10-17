#!/bin/sh
wget https://http.kali.org/kali/pool/main/k/kali-archive-keyring/kali-archive-keyring_2018.1_all.deb
apt install ./kali-archive-keyring_2018.1_all.deb
echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list
echo "deb http://repo.kali.org/kali kali-bleeding-edge main' >> /etc/apt/sources.list"
apt-get update  
apt-get install -y mdk3 macchanger pwgen
echo "Done!"
