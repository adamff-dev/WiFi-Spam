# WiFi Spam
This script allows you to spam WiFi APs/SSIDs

<img src="https://raw.githubusercontent.com/BlueArduino20/WiFi-Spam/master/Screnshot_02.png">

## Notes

- This script allows you to generate the number of APs that you want, unless you're using the default word list (1000 APs).

- If you are going to use the 4th option I recommend you generate up to ~5000 APs

- Some Intel® Hardware In particular Centrino are known to cause problems becuase of the way mdk3 works.

  - From the mdk3 documentaion: 
`MDK3 uses the drivers and Injection routines from this project and its predecessor. Thus, all drivers listed there should work with MDK3. (Some special hardware, like Intel Centrino (ipw2200) is NOT supported since they can only inject data, and no management information!)`

## Dependencies

MDK3 `sudo apt-get install mdk3`: https://github.com/wi-fi-analyzer/mdk3-master

MACCHANGER `sudo apt-get install macchanger` https://github.com/alobbs/macchanger

## Instalation and usage

  1. Download the files `git clone https://github.com/BlueArduino20/WiFi-Spam.git`

  2. Dependencie instalation

    2.1 Method 1 run the install.sh file AS ROOT

    2.2 Method 2 Manualy add sources and install packages listed above

  3. Run the script `sudo WiFiSpam.sh`
