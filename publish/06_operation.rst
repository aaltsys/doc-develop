.. _operation:

#############################
 Right Operation
#############################

Project Management
=============================

Web content projects typically exist in multiple states: edited, committed, 
staged, and deployed. Here is a very brief explanation of content management: 

Editing is work in progress, where changes are not yet a part of a repository. 
When completed, the developer commits work to his local repository. 
Periodically a developer will synchronize his local work with a master 
repository, and then push his commits to be merged into that master. When the 
master repository contains a complete, working version of the project, the 
project will be deployed to the web. 

The developer needs to test the results of his local work in progress, before 
and after committing to his local repository. The merged work of the entire 
project needs to be staged and reviewed. Finally, the current deployed product 
needs to be viewed for comparison during development.

The reader may be thinking, "I never had to do all that with _(insert a CMS 
package name here)_." If so, the reader is not a developer (yet). 

Edit reST Documents
=============================

Create a text document
-----------------------------

::

  cd ~/Projects/doc-firsttask
  kate firstdoc.rst

The extension :file:`.rst` identifies restructured text documents. Make Kate 
the default editor for this document type.

Markup a text document
-----------------------------

Use the notations for :ref:`text structure <structure>` to markup text. Start 
each document of the project with a heading, and go on from there.

View output while editing
-----------------------------

Open the `Interactive rST Editor <http://rst.ninjs.org>`_ in a browser tab, and 
paste text into the left pane. Interpreted HTML output will display on the 
right.

Compile HTML test output
-----------------------------

Compile a text document into HTML output with the command ::

  make clean html

View local compiled HTML
-----------------------------

In a browser tab, substitute your username and the name of your project folder 
into the following URL to see the index of files in a local project, and to 
view the output of individual documents::

  file:///home/__username__/Projects/__projectfolder__/_build/html/index.html 

Periodically Save Work
-----------------------------

What should never have to be said, must be said.

Commit to git Repository
=============================

Track current changes
-----------------------------

Make git aware of current changes with the command::

  git add .

The "dot" means track everything in a project directory. Name specific files 
if everything is not desired. Exclude categories of files from tracking with  
entries in :file:`.gitignore`, as :ref:`previously shown <gitignore>`.

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
 
Build Final Web Content
=============================

The original goal of this guide may seem forgotten, in that a free hosted 
website has not yet materialized. (You are viewing just such a site, of course, 
but that doesn't count.) That goal can be achieved now if all the preliminary
steps are complete.

GitHub deploy requirements
-----------------------------

+ A local project folder with .rst document content
+ git repository and sphinx markup initialized on the project folder
+ Some .rst document content, stored in the repository
+ A GitHub remote master repository which is updated from the local content
+ A **gh-pages** branch in the GitHub repository to contain deployed HTML 
+ A script to build and deploy the site, which is downloaded below.

GitHub deployment script
----------------------------- 

Download script :download:`github-deploy.sh <_downloads/github-deploy.sh>` to
your :file:`Projects` folder, or inside of your project.

Then deploy the site at GitHub with the command::

  bash gitdeploy.sh {project_foldername}

.. Note:: If the script is executed from within your project, omit the 
   ``{project_foldername}`` from the command.

View the deployed site
-----------------------------

In the web browser, substitute your GitHub **username** and **repository** 
name into the following URL to view the site::

  http://_username_.github.com/_repository_

View displayed page source 
-----------------------------

When viewing a site page in the browser, click the :guilabel:`Show Source` 
link in the side menu to display the original text source of the page.

Using the Browser
=============================

Firefox introduced tabs in the web browser, making life better for web 
developers. The following five tabs are useful all the time::

  `Sphinx documentation <http://sphinx.pocoo.org/contents.html>`_ 
  `Online rst Editor <http://rst.ninjs.org/>`_ 
  `Built HTML <file://~/Projects/doc-firsttask/_build/html/index.html>`_ 
  `Deployed project \<http://_yourname_.github.com/_yourproject_/\>`_ 
  `Your GitHub page \<https://github.com/_yourname_\>`_ 
