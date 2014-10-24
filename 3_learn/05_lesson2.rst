.. _logic-lesson:

#############################
Exercise 2: Logic and Control
#############################

Programming with Logic
=============================

This exercise will focus on assembling a program with various compound logic 
commands.

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
than :kbd:`n` would result in executing the script. 

.. warning::
   It may seem obvious, but logic errors are very common when multiple responses 
   or numeric options are used, and a :command:`case` statement processes the 
   input.

Program flow control
-----------------------------

.. sidebar:: Program flow

   .. code-block:: bash

      for OPT in "$@"
      do
        case $OPT in
          -h|--help)
            display-help
            exit
            ;;
          -n|--nodeploy)
            NODEPLOY='YES'
            shift
            ;;
          *)
            PROJECT=$OPT
            shift
            ;;
        esac
      done

Speaking of case statements, the sidebar code demonstrates how a relatively 
complex task, reading and processing a list of items entered in arbitrary order, 
can be addressed with a case branching test enveloped within a looping control. 
Let's break this down. 

*  The expression ``$@`` is an array of all input parameters, ``$1 ... $n``.  
*  The first statement, ``for OPT in "$@"``, iteratively assigns elements of 
   ``$@`` to variable ``OPT``.
*  The second and last statements, ``do ... done``, bound the statements to be 
   iterated with respect to ``OPT``.
*  The statement ``case $OPT in`` specifies to test the values of ``OPT``.
*  Each test ends with a closing parenthesis ``)``. The tests are,
   #. -h or --help: display help, then exit
   #. -n or --nodeploy: set variable NODEPLOY='YES'
   #. Any other input: assign the input value to variable ``PROJECT``

.. warning::
   It may seem obvious, but logic errors are very common when multiple responses 
   or numeric options are used, and a :command:`case` statement processes the 
   input.

-----------------------------------------------------------------------------

A not equal to if/then statement
=================================

.. sidebar:: Example of a not equal to statement
   
   This is an example of a not equal to if/then statement. ::
    
      if [[ $EUID -ne 0 ]] ; then echo -e "\e[1;31m try again using sudo \e[0m" ; exit 1 ; fi
    
   A simple not equal to if/then statement example.

::

   if [[ (variable) -ne (value) ]] ; then (perform action) fi

A logic statement which performs an action if a variable is not equal to a certain  
value, for instance if the length of a variable is not equal to 8, it performs the action, but if the length of the variable is equal to 8, it simply continues running the program.

An equal to if/then/else statement
===================================

.. sidebar:: Example of an equal to if/then/else statement  
   
   This is an example of an if/then/else statement of equality::
    
      if [ "`uname -i`" = "i386" ] 
      then
        CHROMEVER="google-chrome-stable_current_i386.deb"
      else
        CHROMEVER="google-chrome-stable_current_amd64.deb"
      fi
      
   this is a simple if else statement.  

::
    
   if [ variable = value ]                                                               
   then
     (perform action)                                                                                                                                                                  
   else
      (peform other action)                                                                                                                                                                                                                                                                                                                 
   fi                                                                                   
                                                                                  

A logic statement which performs an action if a variable is equal to a value, and     
performs another action if the variable is not equal to that value. for instance, if the length of a variable were equal to 8 it would carry out a certain action, but if the length were NOT equal to 8 it would carry out a different action.                  


A code search statement
========================

.. sidebar:: Example of a code search if/then statement
   
   This is an example of an if/then/else code search statement::
   
      if [[ -z "$(grep 'vm.mmap_min_addr' /etc/modules)" ]] ; then 
         echo -e /n "vm.mmap_min_addr=0" >> /etc/modules ;
      else
         sed -i '/vm.mmap_min_addr/c\vn.mmap_min_addr=0' ~/etc/modules ;
      fi
      
   This an if/then/else statement.

::

   if [[ -z "$(grep "(search term)" /folder/document)" ]] ; then
      echo "(search term)" >> /folder/document
   fi                                                                                   
                                                                      
                                                                                     
A logic statement which searches a file for a specific term, and if it doesn't find   
it it adds the text. note that the dash z means that instead of adding the echo if   
the search term is found, the program adds the echo if the search term is NOT found. Also, the added code in the example which starts with the command "sed" is designed to look for code and replace the line with a new line.   


--------------------------------------------------------------------------------

################################# 
Logic Flow Control Functions
#################################

Wow. Logic Flow Control Functions. That's a big name. looks complicated, right?
Not terribly.

If Else Statements
=====================

IF Else statements take on 1 of 4 forms. 


Form 1::

   if *condition* ; then
      *commands*
   fi

Form 2::

   if *condition* ; then
      *commands*
   else
      *commands*
   fi

Form 3::

   if *condition* ; then
      *commands* 
   elif *condition* ; then
      *commands*
   fi
 
Form 4::

   if *condition* ; then
      *commands* 
   elif *condition* ; then
        *commands*
   else
      *commands*
   fi    
 
Each if else statement has a specific purpose. 

In the first one, the statement checks for a condition, and if the condition is 
true, it performs an action. otherwise, it does nothing

In the second, the statement checks for a condition, and if the condition is 
true, performs an action. if the condition is false, it performs a different 
action.

In the third, the statement checks for a condition, and if it is true, performs 
an action. if the first condition is false, but the second condition is true, it
performs a different action. if neither condition is true, it does nothing.
(note that this could be extended to 5, 20, or even a hundred different
conditions.)

In the fourth, the statement checks for a condition, and if it is true, performs
an action. if the first condition is false but the second condition is true, 
it performs a different action. if none of the conditions are true, it performs 
a different action.(once again, there could be more than 2 conditions)

For/While/Until Loops in bash.
===================================

This section deals with three types of loops. The while loop. the until loop. 
and the for loop.

The While Loop
-------------------

.. sidebar :: Avoiding Infinite Loops.

   Try to avoid Infininte loops whenever possible. An example of an Infininte 
   Loop is::
     
      number=0
      while [ $number -lt 10 ]; do
         echo "Number = $number"
         number=$((number - 1))
      done
    
   You'll notice that Even though it has a condition, it sends it down, not up, 
   meaning it will endlessly spiral downwards away from 10.    

The while loop is used to perform an action for as long as a condition is met. 
for example::

   number=0
   while [ $number -lt 10 ]
   do
      echo "Number = $number"
      number=$((number + 1))
   done

In this example, a number is set to 0, and for as long as the number is less 
than 10 (the -lt is less than), the value of the number is printed, and 1 is 
added to the number until the number reaches 10, when the loop exits.

The Until Loop
---------------------

The Until Loop is a lot like the while loop, except contrary to the while loop,
instead of carrying out a piece of code while a condition is true, it carries 
out a piece of code while a condition is false. Here's an example of an Until 
loop::

   number=0
   until [ $number -ge 10 ]; do
      echo "Number = $number"
      number=$((number + 1))
   done
    
In this example, you'll notice that until the number is greater than or equal to
10 (-ge is greater than or equal to), it echoes the number's value and adds 1.  

The For Loop
----------------

The for loop is designed to increment by one each time and perform a function.

.. sidebar:: Example of a For Loop

   example for loop::
      
     for ((i=0;i<${#TEST};i++))
     do 
        let ADD=$ADD+${MUL[i]}
     done

In the sidebar there's an example of a for loop which was used in a script for 
calculating modulo. As you can see, a for loop uses an iterator(i) and changes 
it's value a little bit every time the loop repeats until the value meets the 
condition which has to be satisfied for the program to continue.

