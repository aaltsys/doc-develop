.. _organize:

#############################
Script / Program Organization
#############################

This article ignores logical proofs regarding the nature of 
`structured programming <http://en.wikipedia.org/wiki/Structured_programming>`_, 
and research into object-oriented development. Instead, program design is 
presented here as a hueristic: organize your work to look a certain way, and 
others will be able to understand what you have done. 

Beyond the unique purpose of each program, all programs can share a consistent 
overall layout. Further, each independent section of a master program can use 
this same design logic. Along the way, warnings introduce safety rules to prevent 
system programming from going awry. Tips describe good programming practice to 
generalize code so it will be reuseable. Sidebars present code examples which 
can be modified to build your own scripts.

Declarations Go First 
=============================

Declare the script language
-----------------------------

.. sidebar:: Program declaration 

   .. code-block:: bash
 
      #! /bin/sh
      # This program sets video resolution ...

Head each script with a declaration, followed by comments describing the 
program's purpose. 

For a shell program to be executed by name, the file permissions executable bit 
must be set and the script must start with a "she-bang" (``#! ...``) directive 
naming the executable shell. (Scripts lacking these requirements can still be 
executed by calling the shell interpreter directly and passing the script name 
as a parameter, as in ``bash myscript parameters``.)

Assign variables before use
-----------------------------

.. sidebar:: Variable initialization 

   .. code-block:: bash
 
      DIR_STATIC='_static'
      MAKE_METHOD='html'
      GITHUB='gh-pages'
      HEROKU='master'
      NODEPLOY=''

Initialize all variables at the top of a script by assigning each variable a 
default value or a null. The form of an assignment statement is the name of the 
variable immediately followed by an equals sign (=), and then followed by a 
quoted value. No space is allowed between the name and =.

.. tip::
   By convention, script variables commonly use uppercase. Linux commands and 
   other syntax are written in lowercase, as defined in the system. Linux is 
   entirely case-sensitive, making variable ``HEROKU`` different from variable 
   ``Heroku``. 

Assign script parameters
-----------------------------

.. sidebar:: Parameter assignment 

   .. code-block:: bash
 
      PROJECT='default'
      if [ $1 != '' ] ; then
        PROJECT=$1
      fi

Assign command parameters to named variables, provided the parameters are being 
passed. Notice that variables are assigned by name with an ``=`` suffixed, but 
a variable is evaluated by prefixing the name with a dollar sign (``$``).

Scripts receive command line parameters as variables numbered ``1`` through 
``n``, passed by value to the script. This means that position matters. For 
instance, a script expecting 2 or 3 parameters, with a default value for the 
third parameter, should test to see that ``$2`` has a value before proceeding.

Define function sections
-----------------------------

.. sidebar:: Defining functions

   .. code-block:: bash

      makedeployment() {
        make clean $MAKE_METHOD BUILDDIR=$DIR_BUILD
        cp -R $DIR_BUILD/$MAKE_METHOD/* $DIR_OUT/
        if [[ -d $DIR_DOWNLOADS ]] ; then
          cp -R $DIR_DOWNLOADS $DIR_OUT/
        fi
      }

Code which may be executed repeatedly in a program, with each execution 
differing only by assigned values, should be placed in functions. 

As the example shows, variables are global and pass by name to functions. 
A function is declared with a name followed by empty parentheses ``()``. The 
commands for the function are then listed enclosed in braces ``{}``. A 
function is called by using its name as a command. 

.. tip::
   Place functions after variables are declared and assigned but before any 
   other code which might call them.

Program or Script Body
=============================

The main body of a program should contain commands and logic to achieve the 
program purpose. Short scripts may have only a main section, but a typical 
script would have variable declarations and functions ahead of the main event.

.. tip::
   Programs which make important changes, say altering system configuration, 
   should start by asking the user to confirm the change.
   
The main body of a program should end with an exit section which tells the user 
what the script has done, or reports any errors on exit.

Comprehendable Scripts
=============================

Programming syntax seems obfuscatory by design, and it is the programmer's duty 
to clarify her work through comments and messages.

Embed documentation comments
-----------------------------

.. sidebar:: Comments

   .. code-block:: bash
 
      # Makedeployment creates _build contents
      makedeployment() {
        make clean $MAKE_METHOD BUILDDIR=$DIR_BUILD
        cp -R $DIR_BUILD/$MAKE_METHOD/* $DIR_OUT/
   
        # add download files provided they exist
        if [[ -d $DIR_DOWNLOADS ]] ; then
          cp -R $DIR_DOWNLOADS $DIR_OUT/
        fi
      }

If the first non-whitespace character in a statement is the hash mark (``#``), 
then the statement is a comment and is not interpreted. Use code comments to:

*  explain the purpose of a particular command or code section
*  provide example values and results for testing
*  include notes on program purpose and practice
*  retain disabled command alternatives when testing code during programming

.. tip::
   A good way to write scripts is to begin by writing only comments. Then, fill 
   in code to achieve the functionality described in the comments.

Display results
-----------------------------

.. sidebar:: Echo results

   .. code-block:: bash
 
      if [[ ! -d $PROJECT ]] ; then
        echo "No Project folder \"$PROJECT\". Exiting ... "
        exit 1
      fi

Use echo commands to display text on an output device, typically on the console 
monitor.

Echo a result to document every exit point of the script or program. Similarly, 
when writing a program, generate every exit condition to verify that exit 
behavior is working correctly. 

Routines which change data on disk, such as modifying file permissions or 
deleting files, must be tested thoroughly before publishing the script. 

.. tip::
   To test a script while programming: for each command which will write data, 
   comment out the actual command and add a statement to echo the results to the 
   display instead. Once the script behavior is tested and verified, uncomment 
   the writing commands and comment out the echo statements. 

Inputs and Logic tests
-----------------------------

.. sidebar:: Decision logic

   .. code-block:: bash
 
      echo -e "\n Install apt-fast?" 
      read -n 1 -p "(y/n)" RESP  
      if [ "$RESP" != 'y' ]; then
        echo -e "\n Canceled"
        exit 1
      fi

Use a read statement to get a single user response at the command line. Use this 
to have the user confirm whenever a script will permanently affect a system. 

Test all possible responses to prevent erroneous or redundant script execution.
In the sidebar example, any input other than :kbd:`y` will cause the script to 
exit. If the script had been written to exit on :kbd:`n`, then any key other 
than :kbd:`n` would result in executing the script. Is this desirable?
