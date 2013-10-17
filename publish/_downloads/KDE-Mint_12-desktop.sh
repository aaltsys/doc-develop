#!/bin/bash
# This script is targeted to Mint 12 KDE (Lisa) or Debian 6 KDE derivatives.
# This desktop script installs general productivity apps and Ruby developer tools.
# The default script interpreter is assumed to be bash, not zsh.

# add repositories

# repository for Cinelerra video editor
sudo apt-add-repository ppa:cinelerra-ppa/ppa
# repository for Ubuntu tweaks
sudo apt-add-repository ppa:tualatrix/ppa
# repository for working rails
sudo apt-add-repository ppa:ubuntu-on-rails/ppa
# repository for HP printer drivers and support
# sudo apt-add-repository ppa:hplip-isv/ppa
# repository for latest stable Firefox 
# sudo add-apt-repository ppa:mozillateam/firefox-stable
# NOTE: as of 02/07/2012, repositories hplip-isv and mozillateam/firefox-stable are not updated to oneiric at launchpad.net

# update repository info
sudo apt-get update

# install latest stable web browsers
wget -O /tmp/chrome.deb https://dl-ssl.google.com/linux/direct/google-chrome-stable_current_i386.deb
sudo dpkg -i /tmp/chrome.deb
rm /tmp/chrome.deb

# Firefox -- upgrade to later version -- replaced transactional package latex-xft-fonts with ttf-lyx
# sudo apt-get install firefox firefox-kde-support ttf-lyx ubufox

# flush apt-get index updates
sudo apt-get -f install

#######################################################################################
# Install apps and tools
# #######################################################################################

# install desktop productivity apps
sudo apt-get -y install blender cinelerra dia filezilla freemind gimp gnucash
sudo apt-get -y install inkscape mypaint openshot scribus shotwell skanlite xaralx

# install desktop utility apps
sudo apt-get -y install adobe-flashplugin aptitude byobu cifs-utils diffuse dosbox dosemu 
sudo apt-get -y install gdebi krdc kubuntu-restricted-extras lftp mc nfs-common 
sudo apt-get -y install openvpn playonlinux putty recordmydesktop screen ubuntu-tweak 
sudo apt-get -y install unison unison-gtk vlc wine wireshark xclip
# Removed hplip-gui due to repository problems -- GARL, 07-05-2012

# fix configuration problem so DOS programs will work
sudo bash < <(echo 'echo "vm.mmap_min_addr=0" >> /etc/sysctl.conf')

# install developer tools -- NOTE: use "mysql" for the mysql password
sudo apt-get -y install bluefish build-essential cream curl eclipse geany git jedit
sudo apt-get -y install libmysqlclient-dev libsqlite3-dev linux-headers-generic mysql-server
sudo apt-get -y install nodejs okteta php5 ruby-full sqliteman subversion ubuntu-dev-tools

# install Sun (Oracle) java
sudo apt-get -y install sun-java6-bin sun-java6-fonts sun-java6-javadb sun-java6-jdk sun-java6-jre sun-java6-plugin

# update repository info
sudo apt-get update

#######################################################################################
# Install web dev frameworks: Ruby --> Rails, 
# later add: Python --> jDango, and PHP --> cakePHP (Symfony2)
# #######################################################################################

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
sudo gem install rails --no-ri --no-rdoc
sudo gem install sqlite3 --no-ri --no-rdoc
sudo gem install mysql --no-ri --no-rdoc
sudo gem install execjs --no-ri --no-rdoc

# Install RVM, bundler
sudo apt-get install zlib1g-dev libreadline5-dev libssl-dev libxml2-dev
curl -L https://get.rvm.io | bash -s stable --rails
# bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
echo "[[ -s \"$HOME/.rvm/scripts/rvm\" ]] && . \"$HOME/.rvm/scripts/rvm\"" >> ~/.bash_profile
source ~/.bash_profile
gem install bundler
bundle install

#######################################################################################
# clean up aptitude at end
# #######################################################################################

sudo aptitude clean
sudo aptitude update
sudo aptitude upgrade
