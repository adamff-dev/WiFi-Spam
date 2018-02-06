#!/bin/sh
apt-key adv --keyserver pgp.mit.edu --recv-keys ED444FF07D8D0BF6
echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list
echo "deb http://repo.kali.org/kali kali-bleeding-edge main' >> /etc/apt/sources.list"
apt-get update  
apt-get install -y mdk3 macchanger
echo "Done!"
