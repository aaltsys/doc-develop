#! /bin/bash

# install, configure apt-fast:

echo -e "\n update mirrors in this installer based on the following URLs:"
echo    " Debian: http://www.debian.org/mirror/list"
echo -e " Ubuntu: https://launchpad.net/ubuntu/+archivemirrors\n"

echo -e -n "\e[1;32m Install apt-fast for Kubuntu 14.04 or Debian 6 KDE?" 
read -n 1 -p " (y/n)" RESP 
echo -e "\e[0m" 
if [ "$RESP" != 'y' ]; then
  echo -e "\nCanceled"
  exit 1
fi

if [[ $EUID -ne 0 ]] ; then 
  echo -e "\e[1;31m try again using sudo \e[0m" 
  exit 1
fi

# !!!!!!!!!!!!!!!!!!!!!!!!!!! apt-manager Routine !!!!!!!!!!!!!!!!!!!!!!!!!!!!!
#===== function to determine apt manager program ==============================

apt-manager() {

  # Determine apt package management command --
  dpkg -s 'apt-fast' > /dev/null
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
    echo -e  "\e[1;94m Updating system repository indexes \e[0m"
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
    dpkg -s $i > /dev/null
    if [ $? -ne 0 ] ; then
      APT=1
      echo "$i is missing, it will be installed"
      $APTMGR -y install $i
    fi
  done

  # verify installation and update packages indexes
  if [ $APT -ne 0 ] ; then
    echo -e "\e[1;94m Updating system packages, this may take a while \e[0m"
    $APTMGR -y -f install && apt-get -y update 
  fi

}

# !!!!!!!!!!  MAIN PROGRAM !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# =============================================================================

# test for package already installed
apt-manager
if [ "$APTMGR" = 'apt-fast' ] ; then
  echo -e "\e[1;32m apt-fast is already installed, exiting ... \e[0m"
  exit 0
fi

# add repository
REPOS='ppa:apt-fast/stable'
apt-repos
# add package
PKGS='apt-fast'
apt-pkgs
# update configuration file
MIRRORS='MIRRORS=("http://us.archive.ubuntu.com/ubuntu,'
MIRRORS+='http://mirror.pnl.gov/ubuntu/,'
MIRRORS+='http://mirrors.centarra.com/ubuntu/,'
MIRRORS+='http://mirror.tocici.com/ubuntu/,'
MIRRORS+='http://mirrors.us.kernel.org/ubuntu/")'
#
sed -r "/MIRRORS=.*$/d" -i /etc/apt-fast.conf
sed -r "$ a\$MIRRORS" -i /etc/apt-fast.conf 
# test installation and provide exit messages
apt-manager
if [ "$APTMGR" = 'apt-fast' ] ; then
  echo -e "\e[1;32m apt-fast installation was successful. \e[0m"
  exit 0
else
  echo -e "\e[1;31m apt-fast installation failed for some reason. \e[0m"
  exit 1
fi
