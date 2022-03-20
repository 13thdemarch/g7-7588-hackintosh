#!/bin/bash

#  ALCPlugFix-Swift Uninstall
#  
#  Created by tarutaru on 09/27/21
#  
 
# Clean up

sudo launchctl unload /Library/LaunchDaemons/com.black-dragon74.ALCPlugFix.plist
sudo rm /Library/LaunchDaemons/com.black-dragon74.ALCPlugFix.plist
sudo rm /Library/Preferences/com.black-dragon74.ALCPlugFix.config.plist
sudo rm /usr/local/bin/ALCPlugFix
