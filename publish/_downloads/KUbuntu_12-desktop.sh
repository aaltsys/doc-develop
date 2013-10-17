#!/bin/bash
# This script is targeted to KUbuntu 12 KDE or Debian 6 KDE derivatives.
# This desktop script installs general productivity apps and Ruby developer tools.
# The default script interpreter is assumed to be bash, not zsh.

# add repositories

# repository for Cinelerra video editor
sudo apt-add-repository ppa:cinelerra-ppa/ppa
# repository for Ubuntu tweaks
sudo apt-add-repository ppa:tualatrix/ppa
# repository for working rails
sudo apt-add-repository ppa:ubuntu-on-rails/ppa

# Install latest stable web browsers

# Firefox -- upgrade to later version -- replaced transitional package latex-xft-fonts with ttf-lyx, add curl to satisfy Chrome requirements
sudo apt-get -y install curl firefox ttf-lyx ubufox 

# install Google Chrome stable
if [ "`uname -i`" = "i386" ] 
then
  CHROMEVER="google-chrome-stable_current_i386.deb"
else
  CHROMEVER="google-chrome-stable_current_amd64.deb"
fi
wget -O /tmp/chrome.deb https://dl-ssl.google.com/linux/direct/$CHROMEVER
sudo dpkg -i /tmp/chrome.deb
rm /tmp/chrome.deb

# update repository info
sudo apt-get update

# flush apt-get index updates
sudo apt-get -f install

# ######################################################################################
# Install apps and tools
# ######################################################################################

# install desktop productivity apps
sudo apt-get -y install blender cinelerra dia filezilla freemind gimp gnucash
sudo apt-get -y install inkscape mypaint openshot scribus shotwell skanlite xaralx

# install desktop utility apps
sudo apt-get -y install adobe-flashplugin aptitude byobu cifs-utils diffuse dosbox dosemu 
sudo apt-get -y install gdebi hplip-gui keepassx krdc kubuntu-restricted-extras lftp mc
sudo apt-get -y install nfs-common openvpn plasma-widget-lancelot playonlinux putty  
sudo apt-get -y install recordmydesktop screen ubuntu-tweak unison vlc wine wireshark 
sudo apt-get -y install xclip

# fix configuration problem so DOS programs will work
sudo bash < <(echo 'echo "vm.mmap_min_addr=0" >> /etc/sysctl.conf')

# install Sun (Oracle) java
sudo apt-get -y install sun-java6-bin sun-java6-fonts sun-java6-javadb sun-java6-jdk sun-java6-jre sun-java6-plugin

# ######################################################################################
# clean up aptitude at end
# ######################################################################################

sudo apt-get clean
sudo apt-get update
sudo apt-get upgrade

sudo reboot