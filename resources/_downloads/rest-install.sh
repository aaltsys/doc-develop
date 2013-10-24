#! /bin/bash
# Install TeX and ReStructured Text documentation tools

# install python and TeX tools
sudo apt-get -y install build-essential python-setuptools texlive-full
sudo apt-get -y install python-dev python-numpy python-qt4 python-qt4-gl python-vtk 

# install sphinx-tools
sudo apt-get -y purge python-configobj python-docutils python-pygments python-sphinx rst2pdf
sudo easy_install configobj docutils pygments sphinx rst2pdf