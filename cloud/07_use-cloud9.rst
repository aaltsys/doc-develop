.. _use_cloud9:

#############################
 Using Cloud9
#############################

.. note:: The Cloud9 editor has a simple command line space at the bottom, as 
   well as a complete Linux console terminal. The Firefox web browser will not 
   paste into a Cloud9 terminal session. When using cut-and-paste to execute
   commands, paste into the editor command line instead.

Cloud9 is a virtual Linux development environment for projects. Project code 
is hosted on a remote repository at either GitHub or BitBucket, and a working 
copy of a project repository will be cloned into the Cloud9 development space. 

Clone a Remote Project
=============================

+  Login to your Cloud9 session at https://c9.io/
+  Under :menuselection:`PROJECTS ON GITHUB`, click a project name

   .. image:: _images/07_cloud9-1.png

+  Click button :guilabel:`CLONE TO EDIT` 
+  Click button :guilabel:`CREATE` to create a workspace in 
   :menuselection:`MY PROJECTS`

   .. image:: _images/07_cloud9-2.png

+  Click button :guilabel:`START EDITING`; the Cloud9 edit space will display
+  Double-click a document name in the left-hand file list to edit the document

Git and GitHub Integration
=============================

The clever developers at Cloud9 have integrated many functions into the 
workspace menu. For example, Git functions can be run from there:

   .. image:: _images/07_cloud9-3.png

Missing from the Git menu selections is the ``git add .`` command. Fortunately
there is an embedded command line at the bottom of the Cloud9 workspace where 
one can type in commands. Following are git commands, most of which can be 
performed from the :menuselection:`Tools --> Git` menu.

Commit to Local Repository
=============================

Track current changes
-----------------------------

Make git aware of current changes with the command::

   git add .

The "dot" means track everything in a project directory. Name specific files 
if everything is not desired. Exclude categories of files from tracking with  
entries in :file:`.gitignore`.

See changes being tracked
-----------------------------

::

   git status

Shows what git has staged to be committed based on :command:`add` commands.

Undo an add
-----------------------------

Clear staged content which you do not want to add with the command::

   git reset

Rename a project file
-----------------------------

Always use git to move or rename a tracked file. The syntax is the same as 
Linux :command:`mv` command, but proceded with :command:`git`::

   git mv old_filename.rst new_filename.rst

Delete a project file
-----------------------------

As with moving a tracked file, use a :command:`git` command when deleting::

   git rm bad_filename.rst

Commit changes to repository
-----------------------------

Periodically add and commit completed content to your local repository::

   git add .
   git status
   git commit -m "type a brief message here describing your changes"

Remote Repository Updates
=============================

Pull remote content
-----------------------------

Before starting a day's work, synchronize your local repository copy to the 
remote master repository::

   git pull

Push local content
-----------------------------

When local content is synchronized with master changes, tested, and committed 
locally, then push the content commits to the remote master::

   git push

.. Note:: If git requires a user password in the :command:`git push` command,
   then an ssh key is missing at GitHub. Follow GitHub directions to add the 
   missing key. 

Upstream Repositories
=============================

When a repository is a fork of a master, changes to the master can be updated 
to the fork as follows. First, an ``upstream`` remote must be added::

   git remote add upstream __remotename__

Then synchronize the local repository with the commands::

   git commit -a "commit current changes"
   git pull upstream master

Finally, refresh the file tree view in cloud9 to show new or changed files.