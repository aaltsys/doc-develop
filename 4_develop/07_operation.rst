.. _operation:

#############################
 Team Collaboration
#############################

1. Project Management
=============================

Web content projects typically exist in multiple states: edited, committed, 
staged, and deployed. The developer needs to test the results of his local work 
in progress, before and after committing to his local repository. The merged 
work of an entire project needs to be staged and reviewed. Finally, the current 
deployed product needs to be viewed for comparison during development.

The reader may be thinking, "I never had to do all that with _(insert a CMS 
package name here)_." If so, the reader is not a developer (yet). Even a  
static website requires multiple development steps as follows.

2. Editing Documents
=============================

The extension :file:`.md` identifies MarkDown documents. Make Kate the default 
editor for this document type.

Markup a text document
-----------------------------

Use the notations for :ref:`MarkDown Syntax <markdown>` to markup text. Start 
each document of the project with a heading, and go on from there.

View output while editing
-----------------------------

Open the `Slekx Editor <http://old-wp.slekx.com/the-markdown-tutorial/>`_ in a 
web browser tab, and paste text into the left pane. Interpreted HTML output 
will display on the right.

Periodically save work
-----------------------------

What should never have to be said, must be said.

3. Repository Commits
=============================

Along with saving work, periodically commit changes into your local git 
repository using the commands described in this section.

Track current changes
-----------------------------

Make git aware of current changes with the command::

  git add .

The "dot" means track everything in a project directory. Specify file names 
if everything is not desired. Exclude categories of files from tracking with  
entries in :file:`.gitignore`, as :ref:`previously shown <gitignore>`.

See changes being tracked
-----------------------------

Shows what git has staged to be committed::

  git status

Undo an add
-----------------------------

Clear staged content which you do not want to add with the command::

  git reset

Rename a document
-----------------------------

Always use git to move or rename a tracked file. The syntax is the same as 
the Linux :command:`mv` command, but proceded with :command:`git`::

  git mv old_filename.md new_filename.md

Delete a document
-----------------------------

As with moving a tracked file, use a :command:`git` command when deleting::

  git rm bad_filename.md

Commit changes to repository
-----------------------------

Periodically add and commit completed content to your local repository::

  git add .
  git status
  git commit -m "type a brief message here describing your changes"

4. Remote Repository Updates
=============================

The changes in a local repository must be merged into the code in a central 
project repository. A programmer updates the central project with these steps. 

Pull remote content
-----------------------------

Before starting a day's work, synchronize your local repository copy to the 
central master repository::

  git pull

Push local content
-----------------------------

When local content is synchronized with master changes, tested, and committed 
locally, then push the content commits to the central master::

  git push

.. Note::

  If git requires a user password in the :command:`git push` command, then an 
  ssh key is missing at GitHub. Follow GitHub directions to add the missing key. 

5. Using the Browser
=============================

Firefox introduced tabs in the web browser, making life better for web 
developers. The following tabs are useful all the time:

+ `MarkDown documentation <http://daringfireball.net/projects/markdown/syntax>`_ 
+ `Online Editor <http://old-wp.slekx.com/the-markdown-tutorial>`_ 
+ `Deployed project <http://_yourname_.github.com/_yourproject_/>`_ 
+ `Your GitHub page <https://github.com/_yourname_/>`_ 

------

.. rubric:: Footnotes

.. [#] See `<http://en.wikipedia.org/wiki/Git_(software)>`_ for information on 
       git. A git online reference manual is at http://gitref.org/.
