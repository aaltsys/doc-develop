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

Download links and commands
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

   wget -O doc-newproject.sh http://develop.aaltsys.info/resources/_downloads/doc-addbranch.sh

doc-deploy.sh
-----------------------------

Deploy a documentation project to either **Github gh-pages** or **Heroku** with 
the command :command:`~/Projects/doc-deploy.sh {project_folder_name}`

| Recommended location for script: :file:`~/Projects/doc-deploy.sh`.
| Download link to script::download:`_downloads/doc-deploy.sh`
| Get the script from the command line with::

   wget -O doc-newproject.sh http://develop.aaltsys.info/resources/_downloads/doc-deploy.sh

.gitignore
-----------------------------

Add the following :file:`.gitignore` file to a documentation project to avoid 
undesirable chuff in the repository.

| Recommended file location: :file:`~Projects/{documentation_folder_name}/.gitignore`.
| Download link to file: :download:`_downloads/.gitignore`.
| Get this file from the command line with::

   wget -O doc-newproject.sh http://develop.aaltsys.info/resources/_downloads/.gitignore

.htaccess
-----------------------------

To add basic authentication to a pseudo-static documentation project deployed on 
Heroku, add the following :file:`.htaccess` server directive file:

| Recommended location: :file:`~/Projects/{documentation_folder_name}/_static/.htaccess`.
| Download link to file: :download:`_downloads/.htaccess`.
| Get this file from the command line with::
   
   wget -O doc-newproject.sh http://develop.aaltsys.info/resources/_downloads/.htaccess
   
.. note:: An :file:`.htpasswd` file is also required, in the same directory.
   Learn about basic authentication using :file:`.htaccess`