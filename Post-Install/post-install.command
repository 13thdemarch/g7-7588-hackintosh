#!/bin/bash

#set -x

clear
echo "Dell G7 7588 Post-Install Script"
echo -ne "\n"
echo "Administrator Privileges is required!"
echo "Please enter your password!"
echo -ne "\n"

if [[ $EUID -ne 0 ]];
then
    exec sudo /bin/bash "$0" "$@"
fi

C_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd $C_DIR

cyan='\033[0;36m'
green='\033[0;32m'
yellow='\033[0;33m'
noColor='\033[0m'

#Install ComboJack
echo -e "${cyan}Installing ComboJack...${noColor}"
cd ComboJack/install && ./install.sh
echo "Done!"
echo -ne "\n"

#Enhance sleep, disable hibernatation
echo -e "${cyan}Disabling Hibernation and Enhancing Sleep...${noColor}"
sudo pmset -a hibernatemode 0
sudo rm -f /var/vm/sleepimage
sudo mkdir /var/vm/sleepimage
sudo pmset -a standby 0
sudo pmset -a autopoweroff 0
sudo pmset -a powernap 0
sudo pmset -a proximitywake 0
echo "Done!"
echo -ne "\n"

echo -e "${green}Installed successful! Please restart to take effect!"
echo "Also, may be a good idea to turn off \"Use ambient noise reduction\""
echo "when using an input method other than the internal mic"
echo "(etc: line-in, headset mic)."
echo -ne "\n"

echo -e "${yellow}Thank you for your donation!${noColor}"
open https://www.paypal.me/tekun0lxrd
echo -ne "\n"

afplay /System/Library/Sounds/Blow.aiff

exit 0