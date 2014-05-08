#! /bin/bash

echo "Install TeX and ReStructured Text documentation tools"

if [[ $EUID -ne 0 ]] ; then echo -e "\e[1;31m try again using sudo \e[0m" ; exit 1 ; fi

# install python and TeX tools
apt-get -y install build-essential python-setuptools texlive-full
apt-get -y install python-dev python-numpy python-qt4 python-qt4-gl python-vtk 

# install sphinx-tools
apt-get -y purge python-configobj python-docutils python-pygments python-sphinx rst2pdf
easy_install configobj docutils pygments sphinx rst2pdf

exit 0