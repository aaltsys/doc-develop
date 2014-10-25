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
|| ``[[ ... ]]`` || keyword for extended test command                        |
||               || Uses lexicographical language order of locale            |
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
   depending on how the variables are quoted. On top of this, strings may be 
   compared literally or by pattern matching, depending on which test is used.

.. seealso::

   `Bash Conditional Expressions <http://www.gnu.org/software/bash/manual/html_node/Bash-Conditional-Expressions.html>`_

   `Advanced Bash-Scripting Guide <http://tldp.org/LDP/abs/html/tests.html>`_

   `Bash Hackers Wiki <http://wiki.bash-hackers.org/start>`_

   On-line bash documentation, ``man bash``.

Decisions &  Flow Control
=============================

Logic is only useful when it is applied to decision making. (Back in the FORTRAN 
days this was called flow control, although it may have a different name now.) 
Bash has six compound expression forms which perform iteration or branching 
based on logic or decisions, as shown following:

+---------------------------------------------------------------------------+
| Bash compound expressions syntax                                          |
+===========================================================================+
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
|| ``while list-1; do list-2; done``                                        |
|| ``until list-1; do list-2; done``                                        |
+---------------------------------------------------------------------------+

List Iterative *for*
-----------------------------

.. code-block:: bash

   for name [ in [ word ... ] ]
   do
     command list
   done

The  ``word`` list following ``in`` is expanded, generating a list of items. 
The variable ``name`` is set to each element of the expanded ``word`` list in 
turn, and the ``command`` list is executed for each turn. 

.. tip::
   #. If operator ``in`` is omitted, the ``for`` command executes the 
      ``command`` list once for each positional parameter that is set.
   #. If the expansion of the ``word`` list (following ``in``) results in an
      empty list, no commands are executed.


Algebraic Iterative *for*
-----------------------------

.. code-block:: bash

   for (( expression1 ; expression2 ; expression3 ))
   do
     command list
   done

Arithmetic expression1 is evaluated by the rules of :ref:`arithmetic_eval`. Then
arithmetic expression2 is evaluated repeatedly until it evaluates to ``0``.  
Each time expression2 evaluates to a non-zero value, the command list is
executed and arithmetic expression3 is evaluated. If any expression is omitted, 
it behaves as if it evaluates to ``1``.


Interactive *select* List
-----------------------------

.. code-block:: bash

   select name [ in word ]
   do
     command list
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
       command list ;;
     pattern2|pattern2)
       command list ;;
     *)
       command list ;;
   esac

A case command first expands **word** (see note 1), and tries to match it 
against each **pattern** in turn, using pathname pattern matching rules (see 
note 2). Once the first match is found, the associated list of commands is 
executed, up to the termination operator, which is processed as follows:

+----------+-----------------------------------------------------------------+
| Operator | Termination result                                              |
+==========+=================================================================+
| ``;;``   | The case statement exits at ``esac``.                           |
+----------+-----------------------------------------------------------------+
| ``;&``   | Execution continues with the command list of next code block.   |
+----------+-----------------------------------------------------------------+
| ``;;&``  | Pattern match testing continues with the next code block.       |
+----------+-----------------------------------------------------------------+

.. tip::
   #. When shell option -nocasematch is enabled, the match is performed without 
      regard to the case of  alphabetic characters.

Branching *if*
-----------------------------

.. code-block:: bash

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


The ``if`` test ``expression`` list is executed. If its exit status is ``0``, 
the ``then`` list is executed.  Otherwise, each ``elif`` test list is executed 
in turn, and if its exit status is ``0``, the corresponding ``then`` list is 
executed and the command completes. Otherwise, the ``else`` list is executed, 
if present, to complete the execution. 

   
Iterative *while* & *until*
-----------------------------

.. code-block:: bash

   while expression list
   do
     command list
   done

   until expression list
   do
     command list
   done

The ``while`` command continuously executes the ``command`` list as long as the 
last statement in the ``expression`` list returns an exit status of ``0``. 
The ``until`` command is identical to the ``while`` command, except that the 
test is negated; the ``command`` list is executed as long as the last statement 
in the test ``expression`` list returns a non-zero exit status.  

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
      under :ref:`arithmetic_eval`.
   #. Pathname pattern matching rules are given in :ref:`glob`.
   #. If any condition expression for a compound statement is invalid, or if
      evaluation results in no commands executed, then the exit status of the
      compound statement will be ``0``. Otherwise, the exit status of a compound 
      statement is the exit status of the last command executed in a list.

.. seealso::

   online manual, terminal command ``man bash``.
