.. _logic:

#############################
Logic and Decisions
#############################

It is said that the beauty of Unix standards comes from their wide variety, and 
the logical expressions and tests in Linux scripting prove this aphorism. 

Logic operations
=============================

A word about programming logic. Typically, logic tests produce one of two 
results: ``true`` (``1``), or ``false`` (``0``). (Right here, those old 
FORTRAN geezers can stop screaming about ``arithmetic if``.) The operators in a 
logic test are mostly either *unary* or *binary*, meaning that a test either 
evaluates a condition of one term, or compares two terms. Lets examine what this 
means. 

Explaining *unary*
-----------------------------

File entries may point to either directories or data. The unary operator ``-d``, 
when applied to a file, returns ``true`` if the entry is a directory, and 
``false`` if it is some data file type. Now suppose the file in question does 
not exist; what should the operator return? Well, a non-entry for a file clearly 
is not a directory, so the test returns ``false``. (Another operator, ``-e``, 
would test whether the file exists.) So: a unary operator should return ``true`` 
or ``false`` with respect to a single condition only.

Explaining *binary*
-----------------------------

Comparison operators are binary, meaning that two terms must be compared. These 
tests might be thought of as arithmetic in nature, even when applied to strings 
of text. It is easy to determine if one string equals another, but what does it 
mean for one string to be greater than another? Do we compare the lengths of 
the strings, or their alphabetic order? We compare alphabetic ordering.

One might suppose that, having defined the meaning of comparisons, only one set 
of comparison operators would be needed, and there would be one way to perform a 
logic test. Well, that is not shell scripting.

Test Constructs
=============================

There are multiple ways to construct a logical test expression: 

+----------------+-----------------------------------------------------------+
|  ``if ...``    |  ``if`` uses the **exit status** of any expression(s)     |
+----------------+-----------------------------------------------------------+
|| ``[`` or      || built-in logical evaluation commands                     |
|| ``test``      || lexicographical string comparisons using ASCII ordering  |
+----------------+-----------------------------------------------------------+
|| ``[[ ... ]]`` ||  keyword for extended test command                       |
||               || Uses lexographical order of locale language              |
+----------------+-----------------------------------------------------------+

.. tip::
   To be certain of how an expression will evaluate, test it in an 
   ``if ... then`` statement:
   
   .. code-block:: bash
   
      if expression(s)
      then echo "Result true"
      else echo "Result false"
      fi

Rules apply to tests and comparisons. Not every situation requires each rule, as 
there are many exceptions. But failure to use these conventions will certainly 
lead to trouble when it is least expected.

#. Initialize every string variable which will be used in a test
#. Partial-quote (") variables and strings inside logic tests
#. Set off brackets (``[`` or ``[[``) with spaces
#. Set off logic comparison operators with spaces
#. Match comparison operators to the logic test, ``[`` or ``[[``, per 
   :ref:`operators`.
#. Match comparison operators to the type of data being tested, per 
   :ref:`operators`.

.. note::
   Rule 1. There is a test difference between strings which have been 
   initialized with zero length, and strings which have never been assigned. 
   Testing ``[ "$STRING" = ""  ]`` may produce an unexpected result if 
   ``$STRING`` is not assigned (null).
   
   Rule 2. Partial-quoting will evaluate embedded variables or expressions in 
   strings. 
   
   Rule 3. ``[`` is an operator and ``[[`` is a keyword; neither one is a 
   grouping enclosure; operators must be surrounded with spaces.
   
   Rule 4. Logic comparisons are operators which must be surrounded by spaces.
   
   Rule 5. Operators listed for ``[[`` only do not apply to ``[``. 
   
   Rule 6. Separate lists of operators apply to string, integer, and file 
   expressions. 

.. warning::
   Some operators, notably ``!=`` and ``==``, have rather different meanings 
   when used within ``[`` rather than ``[[``. This may produce confusing results 
   when comparing variables which evaluate to integers. BASH variables are 
   vaguely typed, and variables may be evaluated (integer) or not (string) 
   depending on how the variables are quoted. Then strings may be compared 
   literally or by Bash pattern matching, depending on which test is used.

.. seealso::

   `Bash Conditional Expressions <http://www.gnu.org/software/bash/manual/html_node/Bash-Conditional-Expressions.html>`_

   `Advanced Bash-Scripting Guide <http://tldp.org/LDP/abs/html/tests.html>`_

   On-line bash documentation, ``man bash``.

Decisions &  Flow Control
=============================

Logic is only useful when it is applied to decision making. (Back in the FORTRAN 
days this was called flow control, although it may have a different name now.) 
Bash has six compound expression forms which perform iteration or branching 
based on logic or decisions, as shown following:

+---------------------------------------------------------------------------+
| Canonical documentation of bash compound expressions                      |
|===========================================================================+
| ``for name [ [ in [ word ... ] ] ; ] do list ; done``                     |
+---------------------------------------------------------------------------+
| ``for (( expr1 ; expr2 ; expr3 )) ; do list ; done``                      |
+---------------------------------------------------------------------------+
| ``select name [ in word ] ; do list ; done``                              |
+---------------------------------------------------------------------------+
| ``case word in [ [(] pattern [ | pattern ] ... ) list ;; ] ... esac``     |
+---------------------------------------------------------------------------+
| ``if list; then list; [ elif list; then list; ] ... [ else list; ] fi``   |
+---------------------------------------------------------------------------+
| ``while list-1; do list-2; done``                                         |
| ``until list-1; do list-2; done``                                         |
+---------------------------------------------------------------------------+

List Iterative *for*
-----------------------------

.. code-block:: bash

   for name [ in [ word ... ] ]
   do
     statement list
   done

The  list of words following in is expanded, generating a list of items.  The variable
name is set to each element of this list in turn, and list is executed each time.   If
the in word is omitted, the for command executes list once for each positional parame‐
ter that is set (see PARAMETERS below).  The return status is the exit status  of  the
last  command that executes.  If the expansion of the items following in results in an
empty list, no commands are executed, and the return status is 0.


Algebraic Iterative ``for``
-----------------------------

.. code-block:: bash

   for (( expression1 ; expression2 ; expression3 ))
   do
     statement list
   done

Arithmetic expression1 is evaluated by the rules of :ref:`arithmetic`. Then
arithmetic expression2 is evaluated repeatedly until it evaluates to ``0``.  
Each time expression2 evaluates to a non-zero value, the statement list is
executed and arithmetic expression3 is evaluated. If any expression is omitted, 
it behaves as if it evaluates to ``1``. The return value is the exit status of 
the last statement list command that is executed, or false if any of the 
test expressions is invalid.


List Interactive *select*
-----------------------------

.. code-block:: bash

   select name [ in word ]
   do
     statement list
   done


The list of words following ``in`` is expanded, generating a list of items. The 
set  of expanded words is printed on the standard error, each preceded by a 
number.  If the ``in`` word is omitted, the positional parameters are printed 
(see PARAMETERS below). The ``PS3`` prompt is then displayed and a line read 
from the standard input. If the line consists of a number corresponding to one 
of the displayed words, then the value of name is set to that word. If the line 
is empty, the words and prompt are displayed again. If ``EOF`` is read, the 
command completes. Any other value read causes name to be set to ``null``. The 
line read is saved in the variable ``REPLY``. The list is executed after each 
selection until a break command is executed.


Branching *case*
-----------------------------

.. code-block:: bash

   case word in 
     pattern|pattern)
       statement list ;;
     pattern2|pattern2)
       statement list ;;
     *)
       statement list ;;
   esac

A case command first expands **word** (see note 1), and tries to match it 
against each **pattern** in turn, using pathname pattern matching rules (see 
note 2). Once the first match is found, the associated list of statements is 
executed, up to the termination operator, which is processed as follows:

+----------+-----------------------------------------------------------------+
| Operator | Termination result                                              |
+==========+=================================================================+
| ``;;``   | The case statement exits at ``esac``.                           |
+----------+-----------------------------------------------------------------+
| ``;&``   | Execution continues with the statement list of next code block. |
+----------+-----------------------------------------------------------------+
| ``;;&``  | Pattern match testing continues with the next code block.       |
+----------+-----------------------------------------------------------------+

.. tip::
   #. When shell option -nocasematch is enabled, the match is performed without 
      regard to the case of  alphabetic characters.

Branching *if*
-----------------------------

.. code-block:: bash

   if testexpressions
   then
     statement list ;
   elif testexpressions
   then
     statement list ;
     ...
   else testexpressions
     statement list ;
   fi


The ``if`` test expressions list is executed. If its exit status is ``0``, the 
``then`` list is executed.  Otherwise, each ``elif`` test list is executed in 
turn, and if its exit status is ``0``, the corresponding ``then`` list is 
executed and the command completes. Otherwise, the ``else`` list is executed, if 
present. 

   
Iterative *while* & *until*
-----------------------------

.. code-block:: bash

   while testexpressions
   do
     statement list
   done

   until expressionlist
   do
     statement list
   done

The ``while`` command continuously executes the statement list as long as the 
last command in the test expressions list returns an exit status of ``0``. 
The ``until`` command is identical to the ``while`` command, except that the 
test is negated; the statement list is executed as long as the last command in 
the test expressions list returns a non-zero exit status.  

---

.. note::
   #. Seven types of command expansion, in order of performance, are: brace 
      expansion; tilde expansion; parameter and variable expansion; arithmetic 
      substitution; command substitution (done in a left-to-right fashion); 
      word splitting; and pathname expansion.
   #. Before evaluation, **word**, **pattern**, ... are expanded by: tilde 
      expansion, parameter and variable expansion, arithmetic substitution, 
      command substitution, followed by process substitution and quote removal.
   #. Arithmetic expressions are evaluated according to the rules described
      below under :ref:`arithmetic`.
   #. Pathname pattern matching rules include the following:

      +----------------+----------------------------------------------------+
      | ``*``          | any string of 0 or more characters                 |
      +----------------+----------------------------------------------------+
      | ``?``          | any string of 0 or 1 character                     |
      +----------------+----------------------------------------------------+
      | ``X`` or ``\X``| where ``X`` represents any (special) character     |
      +----------------+----------------------------------------------------+
      |  ``[XYZ]``     | where ``XYZ`` is a set of permitted characters     |
      +----------------+----------------------------------------------------+
      |  ``[x..z]``    | where ``x..z`` is a range of permitted characters  |
      +----------------+----------------------------------------------------+

   #. The exit status of any compound statement is the exit status of the last 
      command executed in a list, or ``0`` when no list statements are executed.


.. seealso::

   online manual, terminal command ``man bash``.

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

