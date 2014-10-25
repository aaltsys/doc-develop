.. _logic-lesson:

#############################
Exercise 2: Logic and Control
#############################

Using this :download:`example script outline <_downloads/example.sh>`, start a 
new script and name it :file:`logic-control.sh`.

Expanding Commands
=============================

Single vs Double Quotes
-----------------------------

Double-quotes are referred to as partial quoting, while single-quotes are 
full quoting. 

+--------------------------------+-----------------------------------------+
| ``echo $(git branch -a)``      | garbage                                 |
+--------------------------------+-----------------------------------------+
| ``echo '$(git branch -a)'``    | ``git branch -a``                       |
+--------------------------------+-----------------------------------------+
| ``echo "$(git branch -a)"``    | expected output of git branch command   |
+--------------------------------+-----------------------------------------+


+-------------+-----------------------------------------------------------------+
|| (a b ... n)|| assign an array of ``n`` elements: ``array=(1 2 3 4)``         |
|| (expr...)  || group commands ``(expr1; expr2; ...)`` to execute in subshell  |
+-------------+-----------------------------------------------------------------+
| ((expr))    | double-parentheses math construct: ``var = var1 + var2``        |
+-------------+-----------------------------------------------------------------+
| $(expr)     | evaluate command expression (creates subshell)                  |
+-------------+-----------------------------------------------------------------+
| $((expr))   | evaluate an integer arithmetic expression (C-style)             |
+-------------+-----------------------------------------------------------------+
| $[3+4+5]    | evaluate an integer math expression (deprecated)                |
+-------------+-----------------------------------------------------------------+
|| {var}      || brace expansion: ``echo {1,2,3}`` shows ``1 2 3``              |
|| {02..8..2} || expand series starting ``02`` step ``2`` with ``0`` padding    |
|| { expr..; }|| code block: inline group commands into local anonymous function|
+-------------+-----------------------------------------------------------------+
|| ${var:l:n} || at ``l`` from left extract ``n`` characters                    |
||            || negatives start at right and extract by position, not count    |
+-------------+-----------------------------------------------------------------+

Command evaluation *$(...)*
-----------------------------

Parentheses group a list of commands. Prepending the parentheses with ``$`` will 
execute the commands in a subshell and return the result. Local variables will 
not be accessible to the subshell.

Command evaluation *${ ... }*
------------------------------

Braces group a list of commands. Prepending the braces with ``$`` will execute 
the commands in an anonymous local function and return the result. Local 
variables are accessible to the local function.

Integer evaluation *$((...))*
------------------------------

Double-parentheses enclose a math expression. Within the expression, variables 
do not require the ``$`` prefix for evaluation.

Programming with Logic
=============================

This lesson focuses on assembling a program with compound logic commands. First 
start a new program, call it ``control-logic.sh``. Remember, copy in the 
example shell outline or download it from :download:`_downloads/example.sh`.

... With Iterative For
-----------------------------

.. code-block: bash

   for OPT in NAMELIST
   do
     command list
   done

... With Integer For
-----------------------------

.. code-block: bash

   for (( expression1 ; expression2 ; expression3 ))
   do
     command list
   done

... With Select List
-----------------------------

.. code-block: bash

   select name [ in word ]
   do
     command list
   done

... With Case Branching
-----------------------------

.. code-block: bash

   case word in 
     pattern|pattern)
       command list ;;
     pattern2|pattern2)
       command list ;;
     *)
       command list ;;
   esac

... With if branching
-----------------------------

.. code-block: bash

   if expression list
   then
     command list ;
   elif expression list
   then
     command list ;
     ...
   else expression list
     command list ;
   fi

Prompt user to escalate privileges::

   if [[ $EUID -ne 0 ]] ; then echo -e "\e[1;31m try again using sudo \e[0m" ; exit 1 ; fi

Select an optional value and concatenate it based on a system setting::

   CHROMEVER='google-chrome-stable_current_'
   if [ "`uname -i`" = "i386" ] 
   then
     CHROMEVER+='i386.deb'
   else
     CHROMEVER+='amd64.deb'
   fi

Either add or change a configuration setting in a file using programmatic control::

   if [[ -z "$(grep 'vm.mmap_min_addr' /etc/modules)" ]] ; then 
      echo -e /n "vm.mmap_min_addr=0" >> /etc/modules ;
   else
      sed -i '/vm.mmap_min_addr/c\vn.mmap_min_addr=0' ~/etc/modules ;
   fi


... With Iterative While
-----------------------------

.. code-block: bash

   while expression list
   do
     command list
   done

