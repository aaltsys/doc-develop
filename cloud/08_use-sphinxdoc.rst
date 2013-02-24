.. _use_sphinxdoc:

#############################
 Documentation Sample Project
#############################

This exercise will create a new documentation project for a student Journal.

Create a Project Workspace
=============================

In Your GitHub Account
-----------------------------

Create a new repository in GitHub, naming it :file:`doc-journal`.

+  Initialize it with a :file:`readme` so it can be cloned.
+  Do not add a :file:`.gitignore` now.
+  Click :guilabel:`create repository`.

In Your Cloud9 Account
-----------------------------

+  At the top of the left menu, click on :guilabel:`Your Account`.
+  Expand :guilabel:`PROJECTS ON GITHUB` to show available projects.
+  Click :guilabel:`doc-journal` to select it.
+  Click the :guilabel:`CLONE TO EDIT` button.
+  In the :guilabel:`Clone from URL` dialog, click button :guilabel:`CREATE`.
+  Click the :guilabel:`START EDITING` button to open your project workspace.

Install Sphinxdoc in project
-----------------------------

Sphinxdoc documenation tools are installed using python package manager
``easy_install``. Open a terminal to type in the command::

   easy_install -U sphinx

Download Files to Include
-----------------------------

We wish to include some files in this project which are downloadable from the 
following links:

+  :download:`gitignore for Sphinx projects <_downloads/.gitignore>`
+  :download:`Adding documentation to a code project <_downloads/doc-addbranch.sh>`
+  :download:`Starting a documentation project <_downloads/doc-newproject.sh>`
+  :download:`Deploy documentation to GitHub gh-pages <_downloads/doc-deploy.sh>`

Now here is the problem: the web browser downloads files to a local device, not 
to the Cloud9 workspace. To return files to Cloud9, use the Linux command
:command:`wget` instead. Copy and paste the following commands into a terminal 
window or into the console command line beneath an edit window::

   wget http://alt-davenport.github.com/doc-devcloud/_downloads/.gitignore
   wget http://alt-davenport.github.com/doc-devcloud/_downloads/docproject-start.sh
   wget http://alt-davenport.github.com/doc-devcloud/_downloads/github-deploy.sh

After getting the files, click the :guilabel:`gear icon` on top of the left 
sidebar, and choose :guilabel:`Refresh Project Tree` to see the additions.

.. hint:: :file:`.gitignore` is a hidden file. To see hidden files, click the 
   :guilabel:`gear icon` and choose :guilabel:`Show Hidden Files`.

Initialize Sphinxdoc
=============================

In your Cloud9 doc-journal workspace, open a terminal and type the command::

   bash docproject-start.sh

.. note:: The :program:`docproject-start.sh` script runs right away in projects 
   which are cloned from GitHub. Otherwise, the script requires the following
   two commands to be executed first::

      git init
      git remote add origin git@github.com:__username__/__project__.git

The Sphinxdoc quickstart asks these questions::
   
   Root path for the documentation [.]:
   Separate source and build directories (y/N) [n]:
   Name prefix for templates and static dir [_]:
   Project name: __Cloud Development Journal__
   Author name(s): __Your Name Here__
   Project version: __1.0__
   Project release [1.0]:
   Source file suffix [.rst]:
   Name of your master document (without suffix) [index]:
   Do you want to use the epub builder (y/N) [n]: __y__
   autodoc: automatically insert docstringss from modules (y/N) [n]:
   doctest: automatically test code snippets in doctest blocks (y/N) [n]:
   intersphinx link between Sphinx documentation of different projects (y/N) [n]: __y__
   todo: write "todo" entries that can be shown or hidden on build (y/N) [n]:
   coverage: checks for documentation coverage (y/N) [n]:
   pngmath: include math, rendered as PNG images (y/N) [n]:
   mathjax: include math, rendered in the browser by MathJax (y/N) [n]:
   ifconfig: conditional inclusion of content based on config values (y/N) [n]:
   viewcode: include links to the source code of documented Python objects (y/N) [n]:
   Create Makefile? (Y/n) [y]:
   Create Windows command file? (Y/n) [y]: __n__

Be careful when answering these questions, as you get only one chance. Six 
questions have suggested answers (surrounded by underlines); the rest are 
defaulted. Type your answers NOT INCLUDING UNDERLINES.

.. hint:: Sphinx appends **'s Documentation** to the :guilabel:`Project name`. 
   For example, the entry *Cloud Development Journal* will become the title
   **Cloud Development Journal's Documentation**.

Write Documents
=============================

As with any discipline, software development requires a broad scope of 
expertise. Each area of computer knowledge addressed here should have a 
corresponding document in your journal. In this way, your journal will 
document your progress as an application developer. 

What to write
-----------------------------

Here is a list of suggested document topics for your journal:

+-----------------------+-----------------------------------------------------+
| Document identifier   | Description or Title                                |
+=======================+=====================================================+
| 01_cloud-services.rst | Notes on cloud services                             |
+-----------------------+-----------------------------------------------------+
| 02_bash-console.rst   | Linux BASH commands and their uses                  |
+-----------------------+-----------------------------------------------------+
| 03_bash-scripting.rst | Writing programs as BASH scripts                    |
+-----------------------+-----------------------------------------------------+
| 04_rst-syntax.rst     | ReStructuredText documentation syntax               |
+-----------------------+-----------------------------------------------------+
| 05_doc-projects.rst   | Documentation project repositories                  |
+-----------------------+-----------------------------------------------------+
| 06_ruby-syntax.rst    | Ruby programming language syntax notes              |
+-----------------------+-----------------------------------------------------+
| 07_rails-guide.rst    | Rails web application framework notes               |
+-----------------------+-----------------------------------------------------+
| 08_ruby-gems.rst      | Notes on Ruby gems aded to projects                 |
+-----------------------+-----------------------------------------------------+
| 09_other-addins.rst   | Other program additions (Twitter Bootstrap, e.g.)   |
+-----------------------+-----------------------------------------------------+
| 10_ruby-projects.rst  | Ruby and Rails software projects                    |
+-----------------------+-----------------------------------------------------+
| 11_html-css.rst       | HTML and CSS syntax and notes                       |
+-----------------------+-----------------------------------------------------+
| 12_javascript.rst     | Javascript syntax and notes                         |
+-----------------------+-----------------------------------------------------+
| 13_project-mgmt.rst   | Collaborative development project management        |
+-----------------------+-----------------------------------------------------+

Do not start out by creating all these documents. Create journal documents only
as you encounter information which needs to be organized in its own topic.

How to write it
-----------------------------

Each journal document must be written as a plain text document in the editor,
using proper ReStructuredText markup with added Sphinx features. Refer to the  
following resources to learn about document syntax:

+  Davenport's :ref:`guide to basic ReStructuredText syntax <rst-syntax>`.

+  `The official Sphinx-doc documentation site <http://sphinx-doc.org/index.html>`_.

Index your project
-----------------------------

Notice that the topics listed previously are numbered. Sphinx has index 
commands to organize a series of numbered documents and build a table of 
contents for the project. For example, this project uses the following 
instructions to build part of the Table of Contents page::

   Table of Contents:
   ====================
  
   .. toctree::
      :maxdepth: 2
      :glob:
   
      [0-9]*

Archive and Publish Site
=============================

Normally a developer would compile work and display the result locally during 
development.

Compiling and Previewing
-----------------------------

This works at Cloud9, too. The Sphinx command to compile HTML pages from your 
documentation project is:: 

   make clean html

To view the documents you have built, open the :file:`_build/html/index.html` 
file in your Cloud9 project workspace. Then select :menuselection:`Preview` 
from the top menu.

Committing Repository
-----------------------------

At the end of a day, or when a portion of work is finished, it should be 
committed and pushed to the GitHub repository. Here are commands for that::

   git add .
   git status
   git commit -m "commit message"
   git push

Most of these actions are available from the Cloud9 menu as well.

Deploying
-----------------------------

Work would be deployed only when completed satisfactorily. Your project will be 
deployed at GitHub as a **gh-pages** repository branch. The command to deploy 
documentation in a **gh-pages** branch is::

   bash github-deploy.sh

Now the sequence of steps to build and deploy output might be:

+-------------------------------+---------------------------------------------+
| Development Step              | Corresponding terminal command              |
+===============================+=============================================+
| Edit documents                |                                             |
+-------------------------------+---------------------------------------------+
| Check for compile errors      | ``make clean html``                         |
+-------------------------------+---------------------------------------------+
| Preview changes in browser    | cloud9 :menuselection:`Preview`             |
+-------------------------------+---------------------------------------------+
| Add changes to git tracking   | ``git add .``                               |
+-------------------------------+---------------------------------------------+
| View repository status        | ``git status``                              |
+-------------------------------+---------------------------------------------+
| Commit changes to repository  | ``git commit -m "commit message"``          |
+-------------------------------+---------------------------------------------+
| Push to remote at GitHub      | ``git push``                                |
+-------------------------------+---------------------------------------------+
| Build and deploy gh-pages     | ``bash github-deploy.sh``                   |
+-------------------------------+---------------------------------------------+
| View deployed site in browser | ``http:__yourname__.github.com/__project__``|
+-------------------------------+---------------------------------------------+