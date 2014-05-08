#!/bin/bash
# This script is targeted to KUbuntu 13 KDE or Debian 6 KDE derivatives.
# This desktop script installs general productivity apps and Ruby developer tools.
# The default script interpreter is assumed to be bash, not zsh.

# Not working lines with release of KUbuntu 13 are marked with !!
# Problem packages are: chrome, cinelerra, adobe-flashplugin, sun-java6

echo "Install packages for Kubuntu 13.10 or other Debian 6 KDE"

if [[ $EUID -ne 0 ]] ; then echo -e "\e[1;31m try again using sudo \e[0m" ; exit 1 ; fi

# add repositories

# universe/multiverse repositories
add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"
# repository for Ubuntu tweaks
apt-add-repository ppa:tualatrix/ppa
# repository for working rails
apt-add-repository ppa:ubuntu-on-rails/ppa
# repository for Cinelerra video editor
# !!    apt-add-repository ppa:cinelerra-ppa/ppa

# Install latest stable web browsers

# Firefox -- upgrade to later version -- replaced transitional package latex-xft-fonts with ttf-lyx, add curl to satisfy Chrome requirements
apt-get -y install curl firefox ttf-lyx ubufox 

# install Google Chrome stable
if [ "`uname -i`" = "i386" ] 
then
   CHROMEVER="google-chrome-stable_current_i386.deb"
else
   CHROMEVER="google-chrome-stable_current_amd64.deb"
fi
# !! wget -O /tmp/chrome.deb https://dl-ssl.google.com/linux/direct/$CHROMEVER 
# !!    dpkg -i /tmp/chrome.deb 
# !! rm /tmp/chrome.deb 

# update repository info
apt-get update

# flush apt-get index updates
apt-get -f install

# ######################################################################################
# Install apps and tools
# ######################################################################################

# install desktop productivity apps
# !! apt-get -y install blender cinelerra dia filezilla freemind gimp gnucash
apt-get -y install blender dia filezilla freemind gimp gnucash
apt-get -y install inkscape mypaint openshot scribus shotwell skanlite xaralx

# install desktop utility apps
# !! apt-get -y install adobe-flashplugin aptitude byobu cifs-utils diffuse dosbox dosemu
apt-get -y install aptitude byobu cifs-utils diffuse dosbox dosemu
apt-get -y install gdebi hplip-gui keepassx krdc kubuntu-restricted-extras lftp mc
apt-get -y install nfs-common openvpn plasma-widget-lancelot playonlinux putty  
apt-get -y install recordmydesktop screen ubuntu-tweak unison vlc wine wireshark 
apt-get -y install xclip

# fix configuration problem so DOS programs will work
if [[ -z "$(grep 'vm.mmap_min_addr=0' /etc/modules)" ]] ; then 
   echo "vm.mmap_min_addr=0" >> /etc/modules
fi

# install Sun (Oracle) java
# !! apt-get -y install sun-java6-bin sun-java6-fonts sun-java6-javadb sun-java6-jdk sun-java6-jre sun-java6-plugin

# ######################################################################################
# clean up aptitude at end
# ######################################################################################

apt-get clean
apt-get update
apt-get upgrade

reboot
