#! /bin/bash

echo "Install TeX and ReStructured Text documentation tools"

# if [[ $EUID -ne 0 ]] ; then echo 'try again using sudo' ; exit 1 ; fi
# Clear and reestablish sudo privileges to run this program as root
sudo -k
echo -e "\e[1;31m Authentication required \e[0m"
sudo bash << SCRIPT

   # install python and TeX tools
   apt-get -y install build-essential python-setuptools texlive-full
   apt-get -y install python-dev python-numpy python-qt4 python-qt4-gl python-vtk 

   # install sphinx-tools
   apt-get -y purge python-configobj python-docutils python-pygments python-sphinx rst2pdf
   easy_install configobj docutils pygments sphinx rst2pdf

SCRIPT