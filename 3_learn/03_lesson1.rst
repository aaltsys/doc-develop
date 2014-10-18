.. _organize_lesson:

#############################
Shell Scripting Exercise
#############################

When learning to program, 80% of all work is intelligent copying, 10% is 
learning general programming conventions, and 10% is learning specific details 
of a programming language or an environment. The biggest difficulty in 
learning to program is that the last 10%, specific details, is often required 
first. 

In this exercise, use the 80% copying approach to create a script and add 
features incrementally to achieve a final result. Hopefully this approach will 
delay that final 10%.

Example Script Layout
=============================

Warm up the Xerox by highlighting and copying the following code outline, which 
can become the basis of scripts written throughout these exercises. ::

   #! /bin/sh
   # Describe program's principal objective
   # 
   # Initialize variables
   # 
   # User execution confirmation (location varies)
   # 
   # Assign parameters ($n) to named variables
   # 
   # Declare repeated code functions
   # 
   # !! MAIN SECTION !!
   # 
   # Validity tests (setting exit status)
   # 
   # Main code, if Valid
   # 
   # Exit section: echo results, log errors
   # 

Then paste the code into a script file to be created in the following section.

Create a First Script
=============================

Make a text file
-----------------------------

On the Linux desktop, open a file viewer window (:program:`Dolphin`), and check 
the menu option :menuselection:`Control --> Panels --> Terminal` to include the 
terminal console in the display. Create a text file from the console command 
line, and edit the file using :program:`Kate`::

   touch hello-world.sh
   chmod u+x hello-world.sh
   kate hello-world.sh

Hello World
-----------------------------

Based on script samples shown previously, edit your script to display 
"Hello world." Save your work, and test run the script from the command line.

.. tip::
   #. Scripts are text files, but using the filename extension :kbd:`.sh` helps 
      to identify script files to the user.
   #. Instead of using :command:`chmod`, right-click the file icon in dolphin 
      and check :menuselection:`Properties --> Permissions --> Is executable`.

.. hint::
   #. Sidebar examples from the previous page demonstrate commands to use.
   #. All Unixes include on-line resources to provide reference documentation:

      +-----------------+--------------------+---------------------------------+
      | Resource        | Example            | Description                     |
      +=================+====================+=================================+
      | :command:`help` | ``command --help`` | Built-in command documentation  |
      +-----------------+--------------------+---------------------------------+
      | :command:`man`  | ``man command``    | Manual page(s) for command      |
      +-----------------+--------------------+---------------------------------+
      | :command:`info` | ``info command``   | or, Info page(s) for command    |
      +-----------------+--------------------+---------------------------------+

Adding Sections
=============================

User Confirmation
-----------------------------

Add statements to your script to: (1) prompt the user to run the script, and 
(2) process the user's response.

.. hint::
   On the previous page, look for an example of the :command:`read` command for 
   guidance.


