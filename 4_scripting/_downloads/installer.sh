#! /bin/sh
# --- Program Principal Objective ---
# For Kubuntu 14.x or other Ubuntu-based KDE desktop systems: 
# This script installs core utilities and general productivity apps.
# 
# ##### DECLARE VARIABLES
# 
PROMPT=''
EXIT=0
OS=''
VERSION=''
#
# ##### ASSIGN PARAMETERS
# 
# (none used)
# 
# ##### DECLARE FUNCTIONS
# 
confirm() {
  # Requires $PROMPT, returns $EXIT
  tput rev
  echo -n $PROMPT
  read -n 1 -p " (Yes/no)?" RESPONSE
  tput sgr0
  echo
  case $RESPONSE in
    Y*|y*)
      EXIT='0' ;;
    *N*|*n*)
      EXIT='1' ;;
    *)
      EXIT='2' ;;
  esac
}
# 
apt-manager() {
  # Determine apt package management command --
  dpkg -s 'apt-fast' > null
  if [ $? -ne 0 ] ; then
    APTMGR='apt-get'
  else
    APTMGR='apt-fast'
  fi
}
# 
apt-repos() {
  # uses REPOS, APTMGR, returns APT
  # calls apt-manager
  #
  apt-manager
  # Install repositories listed in variable REPOS
  APT=0
  for NAME in $REPOS
  do
    APT+=1
    apt-add-repository $NAME
  done
  # verify installation and update packages indexes
  if [ $APT -ne 0 ] 
  then
    echo -e  "\e[1;32m Updating system repository indexes \e[0m"
    $APTMGR -y -f install && $APTMGR -y update 
  fi
}
#
apt-pkgs() {
  # uses PKGS, APTMGR; returns APT
  # calls apt-manager
  #
  apt-manager
  # Install packages listed in variable PKGS
  APT=0
  for NAME in $PKGS
  do
    dpkg -s $NAME > null
    if [ $? -ne 0 ] ; then
      APT+=1
      echo -e "\e[1;31m $NAME is missing, it will be installed \e[0m"
      $APTMGR -y install $NAME
    fi
  done
  # verify installation and update packages indexes
  if [ $APT -ne 0 ] ; then
    echo -e "\e[1;31m Updating system packages, this may take a while \e[0m"
    $APTMGR -y -f install && $APTMGR -y update 
  fi
}
# 
apt-fast-install() {
  # uses VERSION, EXIT, PROMPT
  # returns PKGS
  # calls apt-repos, apt-pkgs, confirm
  #
  # check if apt-fast is installed
  PKGS='apt-fast'
  dpkg -s $PKGS > null
  if [ $? -ne 0 ] 
  then
    # determine REPOS for apt-fast
    case VERSION in
      11*|12*|13*)
        REPOS='ppa:apt-fast/stable' ;;
      14*|15*|16*)
        REPOS='ppa:saiarcot895/myppa' ;;
      *) ;;
    esac
    #
    if [ $REPOS != '' ]
    then
      PROMPT='Install program apt-fast'
      confirm
      if [ $EXIT -gt 0 ]
      then
        # not confirmed, reset EXIT
        EXIT='0'
      else
        # install apt-fast
        PKGS='apt-fast'
        apt-repos
        apt-pkgs
      fi
    fi
  fi
}
#
# ##### CONFIRM EXECUTION
# 
# Check OS type
read OS < /etc/issue
case $OS in
  Ubuntu*)
    ARRAY=($OS)
    VERSION=${ARRAY[1]} ;;
  Debian*) ;;
  *)
    echo "Not Debian or Ubuntu, exiting ..."
    EXIT=`1` ;;
esac
# 
# Check privileges, user confirmation
if [[ $EUID -ne 0 ]]
then
  echo -e "\e[1;31m try again using sudo \e[0m"
  EXIT='1'
else
  PROMPT='Install packages for Kubuntu'
  confirm
fi
# 
if [[ $EXIT -gt 0 ]]
then exit $EXIT
fi
# 
# !! MAIN SECTION !!
# 
# VALIDITY TESTS
#
apt-fast-install
# 
# CODE
# 
# 
# 
# Exit section: echo results, log errors
# 
echo $EXIT
exit $EXIT
---

#!/bin/bash
# This script is targeted to KUbuntu 13 KDE or Debian 6 KDE derivatives.
# This desktop script installs general productivity apps.
# The default script interpreter is assumed to be dash/bash.

# Not working lines with this KUbuntu release are marked with !!
# Problem packages are: chrome, cinelerra, adobe-flashplugin, sun-java6

echo "Install packages for Kubuntu 14.04 or other Debian 6 KDE"

if [[ $EUID -ne 0 ]] ; then echo -e "\e[1;31m try again using sudo \e[0m" ; exit 1 ; fi

# assumes standard values for whitespace -- safe programming would set this

APT=0
APTMGR='apt-get'
PKGS=''
REPOS=''

# !!!!!!!!!!!!!!!!!!!!!!!!!!! apt-manager Routine !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#===== function to determine apt manager program ==============================

apt-manager() {
  # Determine apt package management command --
  dpkg -s 'apt-fast' > null
  if [ $? -ne 0 ] ; then
    APTMGR='apt-get'
  else
    APTMGR='apt-fast'
  fi
}

# !!!!!!!!!!!!!!!!!!!!!!!!!!! apt-repository Routine !!!!!!!!!!!!!!!!!!!!!!!!!!
#===== function to add a delimited repository list ============================

apt-repos() {

  apt-manager
  # Install repositories listed in variable REPOS
  APT=0
  for i in $REPOS
  do
    APT=1
    apt-add-repository $i
  done
   
  # verify installation and update packages indexes
  if [ $APT -ne 0 ] 
  then
    echo -e  "\e[1;31m Updating system repository indexes \e[0m"
    $APTMGR -y -f install && $APTMGR -y update 
  fi

}

# !!!!!!!!!!!!!!!!!!!!!!!!!!! apt-install Routine !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#===== function to install a delimited package list ===========================

apt-pkgs() {

  apt-manager
  # Install packages listed in variable PKGS
  APT=0
  for i in $PKGS
  do
    dpkg -s $i > null
    if [ $? -ne 0 ] ; then
      APT=1
      echo "$i is missing, it will be installed"
      $APTMGR -y install $i
    fi
  done

  # verify installation and update packages indexes
  if [ $APT -ne 0 ] ; then
    echo -e "\e[1;31m Updating system packages, this may take a while \e[0m"
    $APTMGR -y -f install && $APTMGR -y update 
  fi

}

# !!!!!!!!!!!!!!!!!!!!!!!!!!! Main Program !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#==============================================================================

# install, configure apt-fast
# ###########################

REPOS='ppa:saiarcot895/myppa'
apt-repos
PKGS='apt-fast'
apt-pkgs
MIRRORS='MIRRORS=("http://us.archive.ubuntu.com/ubuntu,'
MIRRORS+='http://mirror.cc.columbia.edu/pub/linux/ubuntu/archive/,'
MIRRORS+='http://mirror.cc.vt.edu/pub2/ubuntu/,'
MIRRORS+='http://mirror.umd.edu/ubuntu/,'
MIRRORS+='http://mirrors.mit.edu/ubuntu/")'
sed -r "/MIRRORS=.*$/d" -i /etc/apt-fast.conf
sed -r "$ a\$MIRRORS" -i /etc/apt-fast.conf
apt-manager

# Add repositories, browsers
# ###########################

# universe/multiverse repositories
apt-add-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"

# add repositories for: Cinelerra, Ubuntu tweaks, Rails
# REPOS='ppa:cinelerra-ppa/ppa ppa:tualatrix/ppa ppa:ubuntu-on-rails/ppa'
# apt-repos

# upgrade Firefox, replace latex-xft-fonts with ttf-lyx, add curl for Chrome
PKGS='curl firefox ttf-lyx ubufox'
apt-pkgs

# install Google Chrome stable
if echo `uname -i` | grep -q 64 ; then
  CHROMEVER="google-chrome-stable_current_amd64.deb"
else
  CHROMEVER="google-chrome-stable_current_i386.deb"
fi
wget -O /tmp/chrome.deb https://dl-ssl.google.com/linux/direct/$CHROMEVER
dpkg -i /tmp/chrome.deb
rm /tmp/chrome.deb

# Install apps and tools
# ###########################

  # install desktop productivity apps
PKGS='blender dia filezilla freemind gimp gnucash inkscape mypaint'
PKGS+=' openshot scribus shotwell xaralx xsane'
# PKGS+=' cinelerra'
apt-pkgs

# install desktop utility apps
PKGS='aptitude byobu cifs-utils diffuse dosbox dosemu'
PKGS+=' hplip-gui keepassx krdc kubuntu-restricted-extras lftp mc'
PKGS+=' nfs-common openvpn plasma-widget-lancelot putty recordmydesktop' 
PKGS+=' screen shutter unison vlc whois wine wireshark xclip'
# PKGS+=' playonlinux ubuntu-tweak'
apt-pkgs

# install Sun (Oracle) java
PKGS='sun-java6-bin sun-java6-fonts sun-java6-javadb sun-java6-jdk'
PKGS+=' sun-java6-jre sun-java6-plugin'
apt-pkgs

# install playonlinux windows game console
# wget -q "http://deb.playonlinux.com/public.gpg" -O- | apt-key add -
# wget http://deb.playonlinux.com/playonlinux_trusty.list -O /etc/apt/sources.list.d/playonlinux.list
# $APTMGR update
# $APTMGR install playonlinux

# clean up aptitude at end
# ###########################

$APTMGR clean && $APTMGR update && $APTMGR upgrade

# Restart system
# ###########################

reboot

################################################################################

# 10/12/14 GARL -- Added apt-fast installation to speed routine