#! /bin/bash
# Install TeX and ReStructured Text documentation tools

echo "This script requires superuser privileges to run."
echo "Enter your password when prompted by sudo."

# clear any previous sudo permission
sudo -k

# run inside sudo
sudo sh <<SCRIPT

   # install python and TeX tools
   apt-get -y install build-essential python-setuptools texlive-full
   apt-get -y install python-dev python-numpy python-qt4 python-qt4-gl python-vtk 

   # install sphinx-tools
   apt-get -y purge python-configobj python-docutils python-pygments python-sphinx rst2pdf
   easy_install configobj docutils pygments sphinx rst2pdf

SCRIPT