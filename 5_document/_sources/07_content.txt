.. _content:

#############################
 Right Content
############################# 

Document Naming
=============================

At the console, type the command::

  ls -al ~/Projects/doc-publishself

The resulting list will show text documents starting with number **00** through 
**08**. These are source documents for viewed pages of this guide, in sequence. 
Sequencing document names by number makes the task of editing much easier. Also 
the :file:`index.rst` file can assemble a directory of numbered documents in 
order through a simple glob command such as :command:`[0-9]*`.

Multi-Section Documents
=============================

This short guide has 10 topic pages, including the index. In comparison, a book 
may have multiple sections with a sequence of chapters within each section. 
Fortunately large publications are  easy to manage with Sphinx. Proceed as 
follows:

Create a GitHub repository
-----------------------------

Instructions for creating a repository have been given previously.

Create folder structure
-----------------------------

+ Create a folder within :file:`~/Projects` for the entire publication.
+ Initialize git in the folder with the command :command:`git init`.
+ Link to GitHub with :command:`git clone git@github.com/_username_/_repository_.git`
+ Create empty subfolders :file:`_deploy` and :file:`_include`.
+ Create an empty subfolder for each section of your book.

Prepare section subfolders
-----------------------------

In the documentation main folder, add a file :file:`sections` which lists the 
section subfolders. This is easily done at the command line::

  echo "subsection1 subsection2 ... " > sections
  echo $(<sections)

In each section subfolder:

+ add folders :file:`_downloads` and :file:`_images`.
+ add a static link to folder :file:`_include`: with the command 
  :command:`ln -s ../_include _include`
+ initialize Sphinx in the subfolder: :command:`sphinx-quickstart`.

.. note:: Knowing what subsections to create at the start is best. Then adding 
   a :file:`sections` file to the documentation folder before running either
   :file:`docproject-start.sh` or :file:`docbranch-add.sh` will create sections 
   initialized correctly from the start.

Improve the Include Files
=============================

Folder :file:`_include` contains file :file:`_404.html`, but this include is 
blank. Replace this with your favorite lolcat or tumbeast error message to help 
personalize your publication.