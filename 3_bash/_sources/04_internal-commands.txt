#############################
Internal Commands.
#############################

+------------------+------------------------------------------------------------------+
|Command name      | Command function/description                                     |
+==================+==================================================================+
|uname             | A command which provides information about the computer/system.  |
+------------------+------------------------------------------------------------------+
|grep              | A command which looks through programs for specific lines of text|
+------------------+------------------------------------------------------------------+
|sed               | A command which finds phrases and replaces the line with new text|
+------------------+------------------------------------------------------------------+
|cp                | A command to copy files                                          |
+------------------+------------------------------------------------------------------+
|change directory  | A command which changes the current working directory            | 
+------------------+------------------------------------------------------------------+
|touch             | changes a file's timestamps and/or the file's modification times.|
+------------------+------------------------------------------------------------------+
|rm                | removes/deletes files                                            |
+------------------+------------------------------------------------------------------+
|mkdir             | makes a new folder if it doesn't exist yet.                      |
+------------------+------------------------------------------------------------------+
|wget              | Retrieves web pages and/or files.                                |
+------------------+------------------------------------------------------------------+
|awk               | finds and replaces text.                                         |
+------------------+------------------------------------------------------------------+
|umount            | unmounts a device.                                               |
+------------------+------------------------------------------------------------------+
|wait              | wait for a process to complete and return its termination status |
+------------------+------------------------------------------------------------------+
|ls                | lists information about files.                                   |
+------------------+------------------------------------------------------------------+
|read              | reads a line from standard input                                 |
+------------------+------------------------------------------------------------------+
|move              | moves or renames files or directories                            |
+------------------+------------------------------------------------------------------+
|while             | is used as part of a while loop                                  |
+------------------+------------------------------------------------------------------+
|read              | gets input from the user                                         |
+------------------+------------------------------------------------------------------+

Environment Variables
========================

Environment Variables are those which are predeclared and can be called from any program, script, or terminal. here's a table of a few Environment Variables

+----------------------+--------------------------------------------------------------+
|Environment Variables | Variable description of use.                                 |
+======================+==============================================================+
| Euid                 | The ID number of the current user.                           |
+----------------------+--------------------------------------------------------------+
|pwd                   | when called, it returns the current directory                |
+----------------------+--------------------------------------------------------------+
|Echo                  | The echo variable simply prints the following text.          |
+----------------------+--------------------------------------------------------------+
|tput setaf 1-7        | A universal color selector.                                  |
+----------------------+--------------------------------------------------------------+ 

Obviously these are just a few of the many Environment Variables, but just to give you an idea of how it works ::

  $PWD
  /home/user: Is a directory
  
That's what happens when you call the pwd Variable from a freshly opened terminal. However, if you were in the Downloads folder you might get ::


  /home/user/Downloads: Is a directory 
  
It all depends on what folder you're in.

