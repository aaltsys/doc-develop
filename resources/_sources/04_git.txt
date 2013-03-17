.. _git:

#############################
Git Version Control
############################# 

**Git** [#]_ is a distributed text code repository which operates as follows:

+  Local workstation project folders include a copy of the repository archive
+  :command:`Commit` adds changes to the local repository copy
+  A remote master or upstream repository maintains the canonical archive
+  :command:`Pull` retrieves remote master archive changes and merges them into
   the local copy
+  :command:`Push` merges local commits with the remote master archive 
+  Collision detection rather than exclusive locking manages conflicts between 
   local and remote archives

Git was written by Linus Torvalds to manage version control for the Linux 
kernel. It has become a *de facto* standard for open-source version control. 
Git is simple in use, and the distributed code approach is well-suited to 
open-source development, where contributors do not share continents, much less 
office space.

Set Up Git 
=============================

Installation
-----------------------------

Git installation packages are available for practically every computer system. 
Here are Linux installation commands:

+------------------------+----------------------------------------------------+
| System                 | Git Installation Command                           |
+========================+====================================================+
| Debian/Ubuntu Linux    | ``sudo apt-get install git-core``                  |
+------------------------+----------------------------------------------------+
| Redhat/Fedora Linux    | ``sudo yum install git-core``                      |
+------------------------+----------------------------------------------------+
| Mac OS-X w/ Mac Ports  | ``sudo port install git-core``                     |
+------------------------+----------------------------------------------------+
| OS-X graphical install | http://code.google.com/p/git-osx-installer         |
+------------------------+----------------------------------------------------+

Use `this guide <http://yuilibrary.com/yui/docs/tutorials/git/>`_ for a more 
detailed explanation of Git packages, versions, and system requirements.

Configuration
-----------------------------

Git stores global settings for each user in home directory file 
:file:`~/.gitconfig`. :command:`Git config` console commands change settings in 
this file. The following global configuration settings are recommended:: 
   
   git config --global user.name "{firstname lastname}"
   git config --global user.email "{email@domain}"
   git config --global branch.master.remote origin
   git config --global branch.master.merge refs/heads/master
   git config --global --add color.ui true

The following configuration is necessary when encased in the Microsoft Windows 
coccoon::

   git config --global core.autocrlf true 

If the :command:`--global` option is omitted, then settings will apply to 
whichever project repository is open at the time. Most git information specific 
to a project is stored in directory :file:`.git` at a project's root folder.

Remote Repository Hosting
=============================

Remote Git repository hosting services are readily available, and so there is 
little reason to install a private Git repository server. Some sites which 
provide free repository services for public and some private repositories are 
listed following:

+--------------------+-------------------------------------------+
| Site name          | URL to site                               |
+====================+===========================================+
| Gitorious          | https://gitorious.org                     |
+--------------------+-------------------------------------------+
| GitHub             | https://github.com                        |
+--------------------+-------------------------------------------+
| Bitbucket          | https://bitbucket.org                     |
+--------------------+-------------------------------------------+

Many website hosting services provide direct integration with repository 
services. Github provides hosting for static sites through **gh-pages** and 
blogs with **octopress**. **Heroku** hosts a variety of code sites with 
deployment occurring through git repository commands:

|   ``heroku create`` adds a git repository remote ``heroku`` to a project
|   ``git push heroku`` deploys project web application code at Heroku

Creating a Project
=============================

Project Folder
-----------------------------

Typically developers manage projects as folders in a :file:`Projects` directory 
within their user :file:`home`. Git commands will create or install a project 
folder in one of two ways:

#. A git server or hosting service, such as Github, will generate a project 
   resource URL. The project can be cloned to a local client with the command::
   
      git clone {project_resource_URL} {folder_path}
   
   for example, clone this project from github into folder :file:`doc-develop` 
   with the command::
   
      git clone git@github.com:aaltsys/doc-develop.git ~/Projects/doc-develop

#. A project is started on a local client and later pushed to a remote server. 
   In this case, the local project is initialized with the command::
   
      git init {folder_path}
   
   for example,
   
      git init ~/Projects/doc-develop

.. _gitignore:

.gitignore
-----------------------------

Your project will contain files with content that you create, and other files 
which are generated by the system, such as compiled code. A git repository 
should track user-created text content and not system files. Using ``nano`` or 
``kate``, create a :file:`.gitignore` file to identify untracked files to git. 
[#]_ Here are suggested entries for :file:`.gitignore` with a documentation 
project using the Linux Kate editor::
  
   # ignore editor backup files 
   *~
   */*~
   # ignore make compilation
   *build/*
   */*build/*
   # ignore deployment content
   *deploy/*
   */*deploy/*
   # keep hidden placeholder files which preserve directories
   !.gitkeep
   !*/.gitkeep

When creating a repository, most hosting services will include a 
:file:`.gitignore` file appropriate to the specified repository type.

Using Git
=============================

Basic git  commands [#]_
-----------------------------

+-------------------------------+------------------------------------------------+
| Git Command                   | Command Purpose                                |
+===============================+================================================+
| ``git pull``                  | retrieve and merge remote changes with local   |
+-------------------------------+------------------------------------------------+
| ``git status``                | display tracked and untracked changes          |
+-------------------------------+------------------------------------------------+
| ``git add {filename}``        | stage and track changes ({filename}=. for all) |
+-------------------------------+------------------------------------------------+
| ``git reset``                 | clear changes staged for commit (undo add)     |
+-------------------------------+------------------------------------------------+
| ``git mv {old} {new}``        | rename files under git version control         |
+-------------------------------+------------------------------------------------+
| ``git rm {-rf} {filepath}``   | delete files under git version control         |
+-------------------------------+------------------------------------------------+
| ``git commit -m "{message}"`` | commit changes to local repository copy        |
+-------------------------------+------------------------------------------------+
| ``git push``                  | add and merge local changes with remote        |
+-------------------------------+------------------------------------------------+

Command Notes:

+  ``git pull`` -- synchronize your local repository copy to the remote master 
   repository before starting a day's work. 
+  ``git add`` -- use the period ("dot") to stage all tracked changes, otherwise 
   name specific files to add. Exclude categories of files using entries in
   :file:`.gitignore`.
+  ``git mv`` -- syntax for :command:`git-mv` is the same as the Linux 
   :command:`mv` command, but proceded with :command:`git`.
+  ``git rm`` -- syntax for :command:`git-rm` is the same as the Linux 
   :command:`rm` command, but proceded with :command:`git`.
+  ``git commit`` -- Provide a terse but descriptive message for your changes. 
+  ``git push`` -- push local content once it is synchronized with master 
   changes, tested, and committed locally.

.. warning:: Always use the :command:`git` command versions for :command:`mv` 
   and :command:`rm` when working with files under version control. The penalty 
   for ignoring this convention is much repeated typing.

.. Note:: If git requires a user password in the :command:`git push` command, 
   then an ssh key is missing at the remote host. Follow directions from the 
   hosting site to add the missing key.  
   
Git in daily workflow
-----------------------------

Start your day's work with::

   git pull
   
Add your local changes and view the results with the command sequence::
   
   git add .
   git status
   git commit -m "{a brief description of the changes for this commit}"

   .. hint:: Git adds and commits your saved work. Therefore, make sure you save 
      changes to documents in the editor before using git commands. 
  
Rename files or delete them with git-specific commands::

   git mv {old_filename} {new_filename}
   git rm {-rf} {path/filename}
  
Update the remote master repository with the command::

   git push

------

.. rubric:: Footnotes

.. [#] For information on git, see http://en.wikipedia.org/wiki/Git_(software). 
       A git online reference manual is at http://gitref.org/.

.. [#] `GitHub Help <http://help.github.com/ignore-files/>`_ has an excellent 
       explanation of :file:`.gitignore`.

.. [#] `Try GitHub <http://try.github.com/>`_ offers a quick tutorial on Git 
       and GitHub to bring you up to speed.

.. [#] Scott Chacon, Pro Git (August 27, 2009, ISBN-10: 1430218339), available
   at Amazon, or for free on-line at http://git-scm.com/book. 

.. [#] Scott Chacon, Pro Git book source (written in MarkDown, not reST) 
   repository on GitHub: https://github.com/progit/progit.

