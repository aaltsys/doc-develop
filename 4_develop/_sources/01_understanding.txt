.. _understanding:

#############################
 Understanding Coding
#############################

Coding is the process of writing input source code: input, because coded text 
input is analyzed by a compiler or interpreter to produce an output result. 
Programmers write two types of code, program source code and document markup,
and they use the same tools to produce both. This page presents those tools.

Text Editing
=============================

Essentially all computer programming is done in a **text editor**, even though 
an Integrated Development Environment (IDE) may be wrapped around the editor.

Repository Systems
=============================

A **repository** is a system for storing code documents. Individual programmers 
use a repository to track code changes and revert to previous versions when 
changes are made in error. 

A repository has the following defining characteristics:

+ It stores the directory and file structure of documents in a project
+ Programmers interact with the repository by committing to the store
+ The repository maintains a commit history to track document revisions 
+ Document versions can be reproduced for any point in the commit history. 

Collaboration Services
=============================

The advantages of using a repository are most evident when **collaborating**, 
where each participant contributes work to a project. Collaboration 
necessitates adding the following features to a repository:

+ The repository must be served from a central networked location 
+ Users should present authentication credentials when committing 
+ Documents have to be locked while undergoing revision (check out/in), or 
+ A method of merging changes from multiple sources must be provided.

Markup Languages
=============================

Programmers write in special computer languages, and they write static 
documents in **markup languages**. Markup is a form of coding which uses simple  
syntax but, unlike a programming language, markup does not include logic. This 
project uses an example repository of a markup document which displays as a 
web page as well, seen at:

	http://github.com/aaltsys/sample-collaborate
