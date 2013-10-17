#!/bin/bash
# for Ubuntu version 10.10 Gnome interface.
# This desktop script installs general productivity apps and Ruby developer tools.
# The default script interpreter is assumed to be bash, not zsh.

# get rid of openoffice
sudo apt-get purge openoffice*

# add repositories

# repository for Cinelerra video editor
sudo apt-add-repository ppa:cinelerra-ppa/ppa
# repository for HP printer drivers and support
sudo apt-add-repository ppa:hplip-isv/ppa
# libreoffice replacement for OpenOffice
sudo apt-add-repository ppa:libreoffice/ppa
# repository for Ubuntu tweaks
sudo apt-add-repository ppa:tualatrix/ppa
# repository for working rails
sudo apt-add-repository ppa:ubuntu-on-rails/ppa
# repository for latest stable Firefox
sudo add-apt-repository ppa:mozillateam/firefox-stable

# update repository info
sudo apt-get update

# install latest stable web browsers
wget -O /tmp/chrome.deb https://dl-ssl.google.com/linux/direct/google-chrome-stable_current_i386.deb
sudo dpkg -i /tmp/chrome.deb
rm /tmp/chrome.deb
# Firefox -- upgrade to later version
sudo apt-get install firefox firefox-gnome-support latex-xft-fonts ubufox

# flush apt-get index updates
sudo apt-get -f install

# #############################################################################################
# Install apps and tools
# #############################################################################################

# install desktop productivity apps
sudo apt-get -y install appinventor-setup blender cinelerra dia filezilla freemind gimp gnucash
sudo apt-get -y install inkscape libreoffice mypaint openshot scribus shotwell simplescan xaralx

# install desktop utility apps
sudo apt-get -y install adobe-flashplugin aptitude byobu cifs-utils diffuse dosbox dosemu gdebi
sudo apt-get -y install hplip-gui ubuntu-restricted-extras lftp mc nfs-common
sudo apt-get -y install nautilus-gksu nautilus-open-terminal openvpn playonlinux putty
sudo apt-get -y install recordmydesktop screen ubuntu-tweak vlc wine wireshark xclip
# fix configuration problem so DOS programs will work
sudo bash < <(echo 'echo "vm.mmap_min_addr=0" >> /etc/sysctl.conf')

# install developer tools
sudo apt-get -y install bluefish build-essential cream curl eclipse geany git jedit
sudo apt-get -y install libmysqlclient-dev libsqlite3-dev linux-headers-generic mysql-server
sudo apt-get -y install netbeans okteta php5 ruby-full sqliteman subversion ubuntu-dev-tools

# install Sun (Oracle) java
sudo apt-get -y install sun-java6-bin sun-java6-fonts sun-java6-javadb sun-java6-jdk sun-java6-jre sun-java6-plugin

# update repository info
sudo apt-get update

# #############################################################################################
# Install web dev frameworks: Ruby --> Rails
# Later: install Python --> jDango, and PHP --> cakePHP (Symfony2)
# #############################################################################################

# gem and Rails
wget -O /tmp/rubygems.tgz http://production.cf.rubygems.org/rubygems/rubygems-1.7.2.tgz
tar -xzf /tmp/rubygems.tgz
cd rubygems-1.7.2
sudo ruby setup.rb
cd ..
rm -rf rubygem*
sudo ln -s /usr/bin/gem1.8 /usr/bin/gem
sudo gem update --system
# export RUBYOPT=rubygems
sudo gem install rails
sudo gem install sqlite3
sudo gem install mysql

# Install RVM, bundler
sudo apt-get install zlib1g-dev libreadline5-dev libssl-dev libxml2-dev
bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
echo "[[ -s \"$HOME/.rvm/scripts/rvm\" ]] && . \"$HOME/.rvm/scripts/rvm\"" >> ~/.bash_profile
source ~/.bash_profile
gem install bundler
bundle install

# #############################################################################################
# clean up aptitude at end
# #############################################################################################

sudo aptitude clean
sudo aptitude update
sudo aptitude upgrade
