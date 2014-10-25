.. _organize_lesson:

#############################
Exercise 1: Organization
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
can become the basis of scripts written throughout these exercises. 

.. literalinclude:: _downloads/example.sh
   :language: bash
   :linenos:

Then paste the code into a script file to be created in the following section.

.. tip::
   Use :program:`dolphin` or other file viewer to display your home folder, and 
   create or open your :file:`Projects` folder. Then create a folder inside 
   :file:`Projects`, maybe called :file:`linux-scripts`, where you can store 
   your work.

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
"Hello World." Save your work, and test run the script from the command line.

.. tip::
   #. Scripts are text files, but using the filename extension :kbd:`.sh` helps 
      to identify script files to the user.
   #. Instead of using :command:`chmod`, right-click the file icon in dolphin 
      and check :menuselection:`Properties --> Permissions --> Is executable`.

.. hint::
   #. Sidebar examples from the previous page demonstrate commands to use.
   #. All Unixes include on-line resources to provide reference documentation:

      +-----------------+--------------------+-----------------------------------+
      | Resource        | Example            | Description                       |
      +=================+====================+===================================+
      | :command:`help` | ``command --help`` | Built-in command documentation    |
      +-----------------+--------------------+-----------------------------------+
      | :command:`man`  | ``man command``    | Manual page(s) for command        |
      +-----------------+--------------------+-----------------------------------+
      | :command:`info` | ``info command``   | or, Info page(s) for command      |
      +-----------------+--------------------+-----------------------------------+

Adding Sections
=============================

Assign a variable
-----------------------------

Declare a variable named :kbd:`DISPLAY` by assigning it the value :kbd:`World`.
In the :command:`echo` statement which displays :kbd:`Hello World`, replace the 
text :kbd:`World` with this new variable. Test the script by executing it in the 
terminal::

   ./hello-world.sh

.. tip::
   The :kbd:`./` is required in front of the script name, so that the command
   interpreter knows the path to the script.

Edit the :program:`hello-world.sh` script to include all four versions of the 
:command:`echo` statement as follows:

.. code-block:: bash

   echo 'Hello DISPLAY'  ; # full quoting
   echo "hello DISPLAY"  ; # partial quoting
   echo 'Hello $DISPLAY' ; # $-operator for evaluation
   echo "Hello $DISPLAY" ; # $ evaluation in partial quotes

Execute script :program:`hello-world.sh`. Which version of the :command:`echo` 
statement worked correctly? Now place a :kbd:`#` symbol at the beginning of 
each faulty statement to comment it. Execute the script again to see that only 
the desired result displays.

.. tip::
   Learning comes from a process of evaluating alternatives, and seeing which 
   one produces a desired result. In aphorisms, "We learn from our mistakes." 
   This guide will present working code examples, but incorrect code will also 
   be used to help demonstrate correct programming conventions.

Read and assign an input
-----------------------------

Based on examples from the previous page, add statements to evaluate input 
parameter 1 and, if it is not blank, assign the value of parameter 1 to the 
variable :kbd:`DISPLAY`. Run the changed script with the following commands::

   ./hello-world.sh
   ./hello-world.sh Ebola

Now include the following four logic test statements preceding your then 
statement, so your code reads:

.. code-block:: bash

   # if [$1 != '']      ; # without spaces around [ ]
   # if [ $1 != '' ]    ; # with !# and single [ ]
   # if [ ! $1 == '' ]  ; # to (!) negate the expression
   # if [[ $1 != '' ]]  ; # w/ single [ and double [[ 
   then DISPLAY=$1
   fi

One at a time: uncomment a statement, test run the script, and note the result 
in the comments (either :kbd:`works` or :kbd:`fails`). 

.. warning::
   Unlike with quoting and variable evaluation, scripting permits several 
   acceptable forms for simple logic expressions. However, complex tests may not 
   work right with just any syntax. To verify results, logic must be tested.

User confirmation
-----------------------------

Add statements to your script to: (1) prompt the user to run the script, and 
(2) process the user's response.

.. hint::
   On the previous page, look for an example of the :command:`read` command for 
   guidance.

Just for Fun(ctionality)
-----------------------------

Replace your user confirmation code with the following statements:

.. code-block:: bash

   echo -e -n '\n\e[1;31m Say Hello'
   read -n 1 -p ' (y/n)?' RESP 
   echo -e '\e[0m' 

Play around with (that means test run) these statements. On the :command:`echo` 
statement, remove the option parameters ``-e`` or ``-n`` and observe the effect. 
Similarly, try removing ``-n 1`` from the :command:`read` statement. Finally, 
why would full quoting (with ``'``) or partial quoting (with ``"``) have the 
same result here?

Example Finished Program
=============================

Download the :download:`hello-world.sh <_downloads/hello-world.sh>` example code 
or just view the code below for one solution to this exercise. 

.. literalinclude:: _downloads/hello-world.sh
   :language: bash
   :linenos:
