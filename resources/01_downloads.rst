.. _downloads:

#############################
Download Helper Files
#############################
 
Shell scripts and helper files are linked as downloads throughout the developer 
documentation. Here is a consolidated list of these files, both as download 
links and as :command:`wget` terminal commands.

.. note:: Assuming the :file:`doc-` script files listed below are saved in 
   folder :file:`~/Projects`, then the scripts may be executed from within 
   project folders with the command format :command:`../{scriptname}`, 
   omitting the :command:`{project_folder_name}` from the command.

Linux installation scripts
=============================

first-install.sh
-----------------------------

After installing Ubuntu Linux (or a derivative) on your computer, download one 
of the following scripts as appropriate, saving it to the desktop with the name 
:file:`first-install.sh`.

| Gnome-Ubuntu_10.10: :download:`_downloads/Gnome-Ubuntu_10.10-desktop.sh`
| KDE-Mint_10: :download:`_downloads/KDE-Mint_10-desktop.sh`
| KDE-Mint_12: :download:`_downloads/KDE-Mint_12-desktop.sh`
| KUbuntu_12: :download:`_downloads/KUbuntu_12-desktop.sh`
| KUbuntu_13: :download:`_downloads/KUbuntu_13-desktop.sh`

Get the respective script from the command line via wget with::

   wget -O first-install.sh http://develop.aaltsys.info/resources/_downloads/Gnome-Ubuntu_10.10-desktop.sh
   wget -O first-install.sh http://develop.aaltsys.info/resources/_downloads/KDE-Mint_10-desktop.sh
   wget -O first-install.sh http://develop.aaltsys.info/resources/_downloads/KDE-Mint_12-desktop.sh
   wget -O first-install.sh http://develop.aaltsys.info/resources/_downloads/KUbuntu_12-desktop.sh
   wget -O first-install.sh http://develop.aaltsys.info/resources/_downloads/KUbuntu_13-desktop.sh
 
Execute the script with the command, :command:`bash first-install.sh`.

rest-install.sh
-----------------------------

To install Restructured Text project support, download the script 
:download:`rest-install.sh` to the desktop and execute it with the command, 
:command:`bash rest-install.sh`. The download command to get the script is:: 

   wget -O rest-install.sh http://develop.aaltsys.info/resources/_downloads/rest-install.sh

RST project command links
=============================

doc-newproject.sh
-----------------------------

Start a new documentation project in your :file:`~/Projects` folder with the
command :command:`~/Projects/doc-newproject.sh {project_folder_name}`. 

| Recommended location for script: :file:`~/Projects/doc-newproject.sh`.
| Download link to script: :download:`_downloads/doc-newproject.sh`.
| Get the script from the command line with::

   wget -O doc-newproject.sh http://develop.aaltsys.info/resources/_downloads/doc-newproject.sh
   
doc-addbranch.sh
-----------------------------

Add documentation into an existing development project with the command 
:command:`~/Projects/doc-addbranch.sh {project_folder_name}`.

| Recommended location for script: :file:`~/Projects/doc-addbranch.sh`.
| Download link to script: :download:`_downloads/doc-addbranch.sh`.
| Get the script from the command line with::

   wget -O doc-addbranch.sh http://develop.aaltsys.info/resources/_downloads/doc-addbranch.sh

doc-deploy.sh
-----------------------------

Deploy a documentation project to either **Github gh-pages** or **Heroku** with 
the command :command:`~/Projects/doc-deploy.sh {project_folder_name}`

| Recommended location for script: :file:`~/Projects/doc-deploy.sh`.
| Download link to script::download:`_downloads/doc-deploy.sh`
| Get the script from the command line with::

   wget -O doc-deploy.sh http://develop.aaltsys.info/resources/_downloads/doc-deploy.sh

aaltsys theme documents
-----------------------------

doc-...sh scripts include custom stylesheet CSS in your documentation project. 
Add these default theme files with the commands::

   mkdir -p _static/aaltsys
   wget -O _static/aaltsys.css_t http://develop.aaltsys.info/resources/_downloads/aaltsys.css_t
   wget -O _static/aaltsys/theme.conf http://develop.aaltsys.info/resources/_downloads/aaltsys/theme.conf
   
.gitignore
-----------------------------

Add the following :file:`.gitignore` file to a documentation project to avoid 
undesirable chuff in the repository.

| Recommended file location: :file:`~Projects/{documentation_folder_name}/.gitignore`.
| Download link to file: :download:`_downloads/.gitignore`.
| Get this file from the command line with::

   wget -O .gitignore http://develop.aaltsys.info/resources/_downloads/.gitignore

.htaccess
-----------------------------

To add basic authentication to a pseudo-static documentation project deployed on 
Heroku, add the following :file:`.htaccess` server directive file:

| Recommended location: :file:`~/Projects/{documentation_folder_name}/_static/.htaccess`.
| Download link to file: :download:`_downloads/.htaccess`.
| Get this file from the command line with::
   
   wget -O _static/.htaccess http://develop.aaltsys.info/resources/_downloads/.htaccess
   
.. note:: An :file:`.htpasswd` file is also required, in the same directory.
   Learn about basic authentication using :file:`.htaccess`
