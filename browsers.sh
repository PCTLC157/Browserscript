#!/bin/bash

##Main Menu Function##
menu () { while true
do
echo "   **Choose Browser to Install**"
echo "a: Firefox Browser Install (Binary)"
echo "b: Google Chrome Browser Install (wget)" 
echo "c: Brave Browser Install (curl)"
echo "d: Vivaldi Browser Install (wget)"
echo "x: Exit"
read -p "Please Enter Your Choice: " number
##case is inspecting the number selected##Number is a variable##
case $number in
	a) firefox;;
	b) chrome;;
	c) brave;;
	d) vivaldi;;
	x) exit;;
#
esac
done
}
#
##a:Install Firefox PeppermintOS##
firefox() {
#mkdir ~/Applications
cd /opt
sudo apt install wget
sudo wget -O FirefoxSetup.tar.xz "https://download.mozilla.org/?product=firefox-latest&os=linux64&lang=en-US"
sudo tar -xf FirefoxSetup.tar.xz
cd -
sudo cp firefox-stable.desktop /usr/share/applications/firefox-stable.desktop
sudo ln -s /opt/firefox/firefox /usr/bin/firefox
echo "Firefox Installed"
sleep 5
clear
}
#
##b:Install Google Chrome PeppermintOS##
chrome() {
sudo apt install wget
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb
echo "Google Chrome Installed"
sleep 5
clear
}
#
##c:Install Brave Browser PeppermintOS##
brave() {
sudo apt install apt-transport-https curl

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

sudo apt update

sudo apt install brave-browser
echo "Brave Browser Installed"
sleep 5
clear
}
#
##d:Install Vivaldi Browser PeppermintOS##
vivaldi() {
sudo apt install wget
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | gpg --dearmor | sudo dd of=/usr/share/keyrings/vivaldi-browser.gpg
echo "deb [signed-by=/usr/share/keyrings/vivaldi-browser.gpg arch=$(dpkg --print-architecture)] https://repo.vivaldi.com/archive/deb/ stable main" | sudo dd of=/etc/apt/sources.list.d/vivaldi-archive.list
sudo apt update && sudo apt install vivaldi-stable
echo "Vivaldi Browser Installed"
sleep 5
clear
}
#
##Needed To Run The Main Menu Function##
menu

