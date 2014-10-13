.. _program:

#############################
Programming Overview
#############################

There are logical proofs regarding the nature of 
`structured programming <http://en.wikipedia.org/wiki/Structured_programming>`_, 
and significant research into object-oriented development, but that is not the 
purpose of this article. Instead, program design is presented here as a 
hueristic: organize your work to look a certain way, and others will be able to 
understand what you have done. 

Beyond the unique purpose of each program, all programs can share a consistent 
overall layout. Further, each independent section of a master program can use 
this same design logic. Along the way, warnings will introduce safety rules to 
prevent system programming from going awry with disastrous consequences. Tips 
will describe good programming practice to make code general and reuseable. 

Program Layout
=============================

Program declaration
-----------------------------

.. sidebar:: Program declaration 

 ::
 
   #! /bin/dash
   # This program sets video resolution ...

Head each script with a declaration, followed by comments describing the 
program's purpose. 

For a shell program to be executed by name, the file permissions executable bit 
must be set and the script must start with a "she-bang" (``#! ...``) directive 
naming the executable shell. (Scripts lacking these requirements can still be 
executed by calling the shell interpreter directly and passing the script name 
as a parameter, as in ``bash myscript parameters``.)

Initialize variables
-----------------------------

.. sidebar:: Variable initialization 

 ::
 
   DIR_STATIC='_static'
   MAKE_METHOD='html'
   GITHUB='gh-pages'
   HEROKU='master'
   NODEPLOY=''

Initialize all variables at the top of a script by assigning each variable a 
default value or a null. The form of an assignment statement is the name of the 
variable immediately followed by an equals sign (=), and then followed by a 
quoted value. No space is allowed between the name and =.

Writing variables in uppercase is a common scripting convention. Linux commands 
and other syntax are written in lowercase, as defined in the system. Linux is 
entirely case-sensitive, making variable ``HEROKU`` different from variable 
``Heroku``. 

Assign Parameters
-----------------------------

.. sidebar:: Parameter assignment 

 ::
 
   PROJECT='default'
   if [ $1 != '' ] ; then
     PROJECT=$1
   fi

Assign command parameters to named variables, provided the parameters are being 
passed. Notice that variables are assigned by name with an ``=`` suffixed, but 
when used the variable name is prefixed with a dollar sign (``$``). 

Scripts receive command line parameters as variables numbered ``1`` through 
``n``, passed by value to the script. This means that position matters. For 
instance, a script expecting 2 or 3 parameters, with a default value for the 
third parameter, should test to see that ``$2`` has a value before proceeding.

Define Subroutines
-----------------------------

.. sidebar:: Declaring subroutines

 ::
 
   makedeployment () {
     make clean $MAKE_METHOD BUILDDIR=$DIR_BUILD
     cp -R $DIR_BUILD/$MAKE_METHOD/* $DIR_OUT/
     if [[ -d $DIR_DOWNLOADS ]] ; then
       cp -R $DIR_DOWNLOADS $DIR_OUT/
     fi
   }

Code which may be executed repeatedly in a program, with each execution 
differing only by assigned values, should be placed in subroutines. 

As the example code shows, variables are global and pass by name to subroutines. 
Therefore subroutines should appear after variables are declared and assigned 
but before any other code which might call them. A subroutine is declared with a 
name followed by empty parentheses ``()``. The code for the subroutine is then 
listed enclosed in braces ``{}``. A subroutine is called just by using its name. 

Embed documentation comments
-----------------------------

.. sidebar:: Comments

 ::
 
   # Makedeployment creates _build contents
   makedeployment () {
     make clean $MAKE_METHOD BUILDDIR=$DIR_BUILD
     cp -R $DIR_BUILD/$MAKE_METHOD/* $DIR_OUT/

     # add download files provided they exist
     if [[ -d $DIR_DOWNLOADS ]] ; then
       cp -R $DIR_DOWNLOADS $DIR_OUT/
     fi
   }

If the first non-whitespace character in a statement is the hash mark (``#``), 
then the statement is a comment and is not interpreted.

Comment code to explain its purpose. A good way to write scripts is to begin 
by writing only comments. Then, fill in code around the comments to achieve the 
described functionality of the program. 

Similarly, when a script will write data, comment out the writing statements and 
echo results to the display instead. Once the script behavior is tested and 
verified, uncomment the writing statements and comment out the echo statements. 

Display results
-----------------------------

.. sidebar:: Echo results

 ::
 
   if [[ ! -d $PROJECT ]] ; then
     echo "No Project folder \"$PROJECT\". Exiting ... "
     exit 1
   fi

Use echo commands to display text on an output device, typically on the console 
monitor.

Echo a result to document every exit point of the script or program. Similarly, 
when writing a program, generate every exit condition to verify that exit 
behavior is working correctly. 

Inputs and Logic tests
-----------------------------

.. sidebar:: Logic tests

 ::
 
   echo -e "\e[1;31m Install apt-fast?" 
   read -n 1 -p "(y/n)" RESP 
   echo -e "\e[0m" 
   if [ "$RESP" != 'y' ]; then
     echo -e "\nCanceled"
     exit 1
   fi

Use a read statement to get a single user response at the command line. This is 
most useful to get a confirmation whenever a script will permanently effect a
system . 

Test all possible responses to prevent erroneous or redundant script execution.
In the sidebar example, any input other than :kbd:`y` will cause the script to 
exit. If the script had been written to exit on :kbd:`n`, then any key other 
than :kbd:`n` would result in executing the script. You may think this is 
obvious, but logic errors are very common when multiple responses or numeric 
options are used, and a :command:`case` statement processes the input.

