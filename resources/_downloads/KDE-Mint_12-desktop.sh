#!/bin/bash
# This script is targeted to Mint 12 KDE (Lisa) or Debian 6 KDE derivatives.
# This desktop script installs general productivity apps and Ruby developer tools.
# The default script interpreter is assumed to be bash, not zsh.

echo "This script requires superuser privileges to run."
echo "Enter your password when prompted by sudo."

# clear any previous sudo permission
sudo -k

# run inside sudo
sudo sh <<SCRIPT

   # add repositories

   # universe/multiverse repositories
    add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"
   # repository for Cinelerra video editor
   apt-add-repository ppa:cinelerra-ppa/ppa
   # repository for Ubuntu tweaks
   apt-add-repository ppa:tualatrix/ppa
   # repository for working rails
   apt-add-repository ppa:ubuntu-on-rails/ppa
   # repository for HP printer drivers and support
   #    apt-add-repository ppa:hplip-isv/ppa
   # repository for latest stable Firefox 
   #    add-apt-repository ppa:mozillateam/firefox-stable
   # NOTE: as of 02/07/2012, repositories hplip-isv and mozillateam/firefox-stable are not updated to oneiric at launchpad.net

   # update repository info
   apt-get update

   # install latest stable web browsers
   wget -O /tmp/chrome.deb https://dl-ssl.google.com/linux/direct/google-chrome-stable_current_i386.deb
   dpkg -i /tmp/chrome.deb
   rm /tmp/chrome.deb

   # Firefox -- upgrade to later version -- replaced transactional package latex-xft-fonts with ttf-lyx
   #    apt-get install firefox firefox-kde-support ttf-lyx ubufox

   # flush apt-get index updates
   apt-get -f install

#######################################################################################
   # Install apps and tools
   # #######################################################################################

   # install desktop productivity apps
   apt-get -y install blender cinelerra dia filezilla freemind gimp gnucash
   apt-get -y install inkscape mypaint openshot scribus shotwell skanlite xaralx

   # install desktop utility apps
   apt-get -y install adobe-flashplugin aptitude byobu cifs-utils diffuse dosbox dosemu 
   apt-get -y install gdebi krdc kubuntu-restricted-extras lftp mc nfs-common 
   apt-get -y install openvpn playonlinux putty recordmydesktop screen ubuntu-tweak 
   apt-get -y install unison unison-gtk vlc wine wireshark xclip
   # Removed hplip-gui due to repository problems -- GARL, 07-05-2012

   # fix configuration problem so DOS programs will work
   bash < <(echo 'echo "vm.mmap_min_addr=0" >> /etc/sysctl.conf')

   # install developer tools -- NOTE: use "mysql" for the mysql password
   apt-get -y install bluefish build-essential cream curl eclipse geany git jedit
   apt-get -y install libmysqlclient-dev libsqlite3-dev linux-headers-generic mysql-server
   apt-get -y install nodejs okteta php5 ruby-full sqliteman subversion ubuntu-dev-tools

   # install Sun (Oracle) java
   apt-get -y install sun-java6-bin sun-java6-fonts sun-java6-javadb sun-java6-jdk sun-java6-jre sun-java6-plugin

   # developer libraries
   apt-get install zlib1g-dev libreadline5-dev libssl-dev libxml2-dev

   #############################################################################
   # clean up aptitude at end
   # ###########################################################################

   aptitude clean
   aptitude update
   aptitude upgrade

SCRIPT

#######################################################################################
# Install web dev frameworks: Ruby --> Rails, 
# later add: Python --> jDango, and PHP --> cakePHP (Symfony2)
# #######################################################################################

# gem and Rails
wget -O /tmp/rubygems.tgz http://production.cf.rubygems.org/rubygems/rubygems-1.7.2.tgz
tar -xzf /tmp/rubygems.tgz
cd rubygems-1.7.2
   ruby setup.rb
cd ..
rm -rf rubygem*
ln -s /usr/bin/gem1.8 /usr/bin/gem
gem update --system
# export RUBYOPT=rubygems
gem install rails --no-ri --no-rdoc
gem install sqlite3 --no-ri --no-rdoc
gem install mysql --no-ri --no-rdoc
gem install execjs --no-ri --no-rdoc

# Install RVM, bundler

curl -L https://get.rvm.io | bash -s stable --rails
# bash < <(curl -s https://rvm.beginrescueend.com/install/rvm)
echo "[[ -s \"$HOME/.rvm/scripts/rvm\" ]] && . \"$HOME/.rvm/scripts/rvm\"" >> ~/.bash_profile
source ~/.bash_profile
gem install bundler
bundle install

