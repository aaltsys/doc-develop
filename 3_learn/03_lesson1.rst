.. _exercise:

#############################
Shell Scripting Exercise
#############################

When learning to program, 80% of all work is intelligent copying, 10% is 
learning general programming conventions, and 10% is learning specific details 
of a programming language or an environment. The biggest difficulty in 
learning to program is that the last 10%, specific details, is often required 
first. 

In this exercise, use the 80% copying approach to create a script and add 
features incrementally to achieve a final result. 

First Script Steps
=============================

Make a text file
-----------------------------

Open a file viewer window (:program:`Dolphin`), and check the 
:menuselection:`Control --> Panels --> Terminal` selection to include the 
terminal console in the display. Create a text file from the console command 
line, and edit the file using :program:`Kate`::

   touch first-script.sh
   kate first-script.sh

Hello World
-----------------------------

Based on script samples shown previously, edit your script to display 
"Hello world." Save your work, and test run the script from the command line.

.. hint::

   #. Use file properties to set permissions and check "Is executable." 
   #. Scripts are text files, but using the filename extension :kbd:`.sh` helps 
      to identify script files to the user.
   #. Sidebar examples from the previous page demonstrate commands to use.
   #. These on-line resources provide reference documentation:
   
      +-----------------+--------------------+---------------------------------+
      | Resource        | Example            | Description                     |
      +=================+====================+=================================+
      | :command:`help` | ``command --help`` | Built-in command documentation  |
      +-----------------+--------------------+---------------------------------+
      | :command:`man`  | ``man command``    | Manual page(s) for command      |
      +-----------------+--------------------+---------------------------------+
      | :command:`info` | ``info command``   | or, Info page(s) for command    |
      +-----------------+--------------------+---------------------------------+

User Confirmation
-----------------------------

Add statements to your script to: (1) prompt the user to run the script, and 
(2) process the user's response.