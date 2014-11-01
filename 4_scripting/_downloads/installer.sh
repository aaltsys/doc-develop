#! /bin/sh
# --- Program Principal Objective ---
# For Ubuntu up to 14.04 or other Ubuntu-based desktop systems: 
# This script installs core utilities and general productivity apps.
# 
# ##### VARIABLE DECLARATIONS
# 
PROMPT=''
EXIT=0
OS=''
VERSION=''
OPER=''
APTMGR='apt-get'
REPOS=''
APT=''
PKGS=''
# default values before configuration
MIRRORS='MIRRORS=("http://us.archive.ubuntu.com/ubuntu'
MIRRORS+=',http://mirror.pnl.gov/ubuntu/'
MIRRORS+=',http://mirrors.centarra.com/ubuntu/'
MIRRORS+=',http://mirror.tocici.com/ubuntu/'
MIRRORS+=',http://mirrors.us.kernel.org/ubuntu/")'
# 
# CONFIGURATION VALUES FROM FILE
# 
# (none used)
#.
# ##### PARAMETER ASSIGNMENTS
# 
# (none used)
# 
# ##### FUNCTION DECLARATIONS
# 
confirm() {
  # uses $PROMPT, returns $EXIT
  #
  tput rev
  echo -n $PROMPT
  read -n 1 -p "? [Y/n]" RESPONSE
  tput sgr0
  echo
  case $RESPONSE in
    Y|y)
      EXIT=0 ;;
    N|n)
      EXIT=1 ;;
    *)
      EXIT=2 ;;
  esac
}
# 
apt-manager() {
  # returns APTMGR
  #
  dpkg -s 'apt-fast' > /dev/null 2>&1
  if [ $? -ne 0 ]
  then
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
    echo -e "\e[1;32m Updating repository indexes \e[0m"
    $APTMGR -y -f install && apt-get -y update 
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
    if [ $OPER = '' ]
    Then OPER='install'
    fi
    case $OPER in
      'purge')
        dpkg -s $NAME > /dev/null 2>&1
        if [ $? -eq 0 ]
        then
          APT+=1
          echo -e "\e[1;33m Installed $NAME will be purged \e[0m"
          $APTMGR -y purge $NAME
        fi
        ;;
      'install')
        dpkg -s $NAME > /dev/null 2>&1
        if [ $? -ne 0 ]
        then
          APT+=1
          echo -e "\e[1;32m Missing $NAME will be installed \e[0m"
          $APTMGR -y install $NAME
        fi
        ;;
      *) ;;
    esac
  done
  # verify installation and update packages indexes
  if [ $APT -ne 0 ]
  then
    echo -e '\e[1;32m Wait as system packages are updated \e[0m'
    $APTMGR -y -f install && apt-get -y update 
  fi
}
# 
apt-fast-config() {
  # updates configuration file /etc/apt-fast.conf 
  # uses MIRRORS, sets /etc/apt-fast.conf
  #
  touch /etc/apt-fast.conf
  sed -r "/MIRRORS=.*$/d" -i /etc/apt-fast.conf
  sed -r "$ a\$MIRRORS" -i /etc/apt-fast.conf
}
# 
apt-fast-install() {
  # uses VERSION, EXIT, PROMPT
  # returns PKGS
  # calls apt-repos, apt-pkgs, confirm
  #
  # check if apt-fast is installed
  dpkg -s 'apt-fast' > /dev/null 2>&1
  if [ $? -eq 0 ] 
  then
    PROMPT='Skip apt-fast mirror configuration'
    confirm
    if [ $EXIT -ne 0 ] 
    then 
      apt-fast-config
      EXIT=0
    fi
  else
    # determine REPOS for apt-fast
    case $VERSION in
      10*|11*|12*|13*)
        REPOS='ppa:apt-fast/stable' ;;
      14.04*)
        REPOS='ppa:saiarcot895/myppa' ;;
      *) 
        echo -e "\e[1;31m apt-fast is not released for $VERSION \e[0m" ;;
    esac
    #
    if [ $REPOS != '' ]
    then
      PROMPT='Install program apt-fast'
      confirm
      if [ $EXIT -gt 0 ] 
      then EXIT=0 ;        # not confirmed, reset EXIT
      else
        # install apt-fast
        PKGS='apt-fast'
        apt-repos
        apt-pkgs
        apt-fast-config
      fi
    fi
  fi
}
#
# ##### CONFIRM EXECUTION
# 
# check OS type 
# Uses PROMPT, returns OS, VERSION, EXIT
read OS < /etc/issue
case $OS in
  Ubuntu*)
    ARRAY=($OS)
    VERSION=${ARRAY[1]} ;;
  Debian*) ;;
  *)
    echo "Not Debian or Ubuntu, exiting ..."
    EXIT=1 ;;
esac
# 
# Check privileges
if [ $EUID -ne 0 ]
then
  echo -e "\e[1;31m try again using sudo \e[0m"
  EXIT=1
else
  # test user confirmation
  PROMPT='Install packages for Kubuntu'
  confirm
fi
# 
if [ $EXIT -gt 0 ]
then 
  echo -e "\e[1;31m Package installation was canceled. \e[0m"
  exit $EXIT
fi
# 
# ##### MAIN VALIDITY TESTS
#
apt-fast-install
# 
# ##### MAIN CODE
# 
# universe/multiverse repositories
apt-add-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"
#
# add repositories for: Cinelerra, Ubuntu tweaks, Rails
# REPOS='ppa:cinelerra-ppa/ppa ppa:tualatrix/ppa ppa:ubuntu-on-rails/ppa'
# apt-repos

# upgrade Firefox, replace latex-xft-fonts with ttf-lyx, add curl for Chrome
PKGS='curl google-chrome-stable firefox ttf-lyx ubufox'
apt-pkgs
#
# install desktop productivity apps
PKGS='blender dia filezilla freemind gimp git gnucash inkscape mypaint'
PKGS+=' openshot scribus shotwell xaralx xsane'
# PKGS+=' cinelerra'
apt-pkgs
#
# install desktop utility apps
PKGS='aptitude byobu cifs-utils diffuse dosbox dosemu'
PKGS+=' hplip-gui keepassx krdc kubuntu-restricted-extras lftp mc'
PKGS+=' nfs-common openvpn plasma-widget-lancelot putty recordmydesktop' 
PKGS+=' screen shutter unison vlc whois wine wireshark xclip'
# PKGS+=' playonlinux ubuntu-tweak'
apt-pkgs
#
# install Sun (Oracle) java
# PKGS='sun-java6-bin sun-java6-fonts sun-java6-javadb sun-java6-jdk'
# PKGS+=' sun-java6-jre sun-java6-plugin'
# apt-pkgs
#
# install playonlinux windows game console
# wget -q "http://deb.playonlinux.com/public.gpg" -O- | apt-key add -
# wget http://deb.playonlinux.com/playonlinux_trusty.list -O /etc/apt/sources.list.d/playonlinux.list
# $APTMGR update
# $APTMGR install playonlinux
# install python and TeX tools
#
OPER='install'
PKGS='python-setuptools python-dev python-numpy python-qt4 python-qt4-gl python-vtk'
PKGS+=' build-essential texlive-full'
apt-pkgs
#
# install sphinx-tools
OPER='purge'
PKGS='python-configobj python-docutils python-pygments python-sphinx rst2pdf'
apt-pkgs
easy_install configobj docutils pygments sphinx rst2pdf 
#
# ##### EXIT CODE
# 
apt-get clean && apt-get update && apt-get upgrade

if [ $EXIT -eq 0 ] 
then
  PROMPT='Installation successful. Reboot now'
  if [ $EXIT -gt 0 ] 
  then reboot &
  fi
else echo "EXIT value is $EXIT"
fi

exit $EXIT

################################################################################

# 10/12/14 GARL -- Added apt-fast installation to speed routine
# 10/29/14 GARL -- Rewritten for TechCamp 2014 workshop
