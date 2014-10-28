.. _logic-lesson:

#############################
Exercise 2: Evaluating Logic
#############################

Using this :download:`example script outline <_downloads/example.sh>`, start a 
new script and name it :file:`expressions.sh`. This time, the script will be 
used to test various scripting conventions. 

Expanding Commands
=============================

The first thing to try is variable substitution and expression evaluation. One 
aspect of scripting is the concept of embedding variables and other expressions 
directly into text strings. Embedded expressions are evaluated when they are 
prefixed with the ``$`` sign, provided the expressions are not embedded in text, 
or are unquoted, or are partially quoted.

.. sidebar:: Partial and full quoting

   .. code-block:: bash

      COMMAND='git branch -a'
      echo $COMMAND
      echo '$COMMAND'
      echo "$COMMAND"

Single vs Double Quotes
-----------------------------

Double-quotes are referred to as partial quoting, while single-quotes are 
full quoting. Full quoting evaluates to the literal text within the quotes, 
while partial quoting performs variable and command expansion during evaluation. 
Test out quoting as follows:

.. admonition:: Instruction
   
   Paste the sidebar statements into the MAIN section of the new script, then 
   run the script. Did any statement(s) produce expected results? Comment out 
   statements which did not work as intended.

.. sidebar:: Evaluating a command expression

   .. code-block:: bash
   
      COMMAND='git branch -a'
      echo $( "$COMMAND" )
      $( echo $COMMAND )
      $( echo '$COMMAND' )
      $( echo "$COMMAND" )

Command evaluation *$(...)*
-----------------------------

Commands are evaluated when enclosed in parentheses that are prepended with the 
``$``. The difference between command evaluation and quoting is, quoting just 
displays text, possibly with expanded variables, while evaluation actually runs 
commands. 

.. admonition:: Instruction

   Add the sidebar statements into the :file:`expressions.sh` script, then 
   run the script. Which syntax produces the output of the ``git`` command?
   
   Note that ``$COMMAND`` is a variable, not a command. The :command:`echo` 
   commmand must be used to feed that result as a command to the evaluation.

.. sidebar:: Grouped command expressions

   .. code-block:: bash

      TEXT='embedded grouped commands'
      $(
        echo -e '\e[31m These statements test'
        echo -e " $TEXT. \e[0m"
      )
      #
      echo -e $(
        '\e[32m These statements test'
        " $TEXT. \e[0m"
      )
      #
      echo -e $(
        echo '\e[32m These statements test'
        echo " $TEXT. \e[0m"
      )

Grouped Commands *$(...)*
-----------------------------

Parentheses prepended with ``$`` will also group a list of commands. For 
:program:`bash`, the commands will execute in a subshell and return the result, 
and local variables may not be accessible to a subshell. Other shells such as 
:program:`dash`, the default shell for Debian and Ubuntu, do not use a subshell 
and therefore can access local variables.

.. admonition:: Instruction

   Add the sidebar commands into your script, then view the results.

This example tries three versions of command execution. Notice that a 
command, in this case :command:`echo`, must be inside the parentheses. Then 
the ``-e`` option is not needed inside the parentheses. Instead, the inside
:command:`echo` commands serve to pass a string to the execution, and the 
outside command then echoes the result *including the embedded color codes*.
Question: were local variables assigned in the subshell?

.. sidebar:: Grouped command functions

   .. code-block:: bash

      TEXT='an embedded anonymous function'
      echo -e ${
        echo '\e[32m These statements test'
        echo " $TEXT. \e[0m"
      }

Anonymous functions *${ ... }*
------------------------------

Braces group a list of commands. Prepending the braces with ``$`` will execute 
the commands in an anonymous local function and return the result. Local 
variables are accessible to the local anonymous function.

.. admonition:: Instruction

   Add this next set of sidebar commands into your script, then examine the 
   results. 

   Hmm. Maybe we are not actually using :program:`bash`. If ``$( ... )`` is 
   treated as an anonymous function, the ``${ ...}`` syntax may not be supported 
   for grouped commands. However, this syntax will evaluate variables.

.. sidebar:: Integer calculation evaluation

   .. code-block:: bash

      SEVEN=7 ; FIVE=5
      echo -e '\e[32m $FIVE times $SEVEN is $(( FIVE * SEVEN )) \e[0m'
      echo -e "\e[32m $FIVE times $SEVEN is $(( FIVE * SEVEN )) \e[0m"

Integer calculation *$((...))*
------------------------------

Double-parentheses enclose a math expression. Within the expression, variables 
do not require the ``$`` prefix for evaluation. 

The :command:`let ...` command is a synonym for double-parentheses, but it is 
not recommended because :command:`let` lacks closure and flexibility. 

.. admonition:: Instruction

   Add these sidebar commands to your script, then view the results. Just for 
   fun, try replacing the ``$(( ... ))`` expression with ``let ...``?

Expressions Test Results
=============================

Probably this has been about all the programming fun one can stand. Fortunately 
we are finished with syntax for evaluating expressions. Sample program results 
for this section and the following topic on logic can be viewed on a separate
page: :ref:`expressions-answers`.

Programming with Logic
=============================

This lesson focuses on assembling a program with compound logic expressions. 
First start a new program, call it ``control-logic.sh``. Remember, copy in the 
example shell outline or download it from :download:`_downloads/example.sh`.

.. sidebar:: Iterative for

   .. code-block:: bash

      for NAME in 'in' 'inn' 'ian' 'eoin'
      do
        echo $NAME
      done

Iterative For
-----------------------------

Use the iterative :command:`for` command to step through a list or an array of 
values. For example, the parameters passed to a script could be processed by
referring to array ``$@``.


.. admonition:: Instruction

   Add these sidebar commands to the main section of script 
   :file:`logic-control.sh`, then run the script to view the results. 

Try this command without quoting the word list. Could this syntax be confusing?

.. sidebar:: Integer for

   .. code-block:: bash

      for (( K=4; $K -ge 0; $K-- ))
      do
        echo "The negative of $K squared is: -$(( K * -K ))"
      done

Integer For
-----------------------------

Use the integer for with three-expression operator for iterating a number of 
times, or iterating on an indexed list of options.


.. admonition:: Instruction

   Add these sidebar commands to your script, then view the results. 

Evaluation stops at the first error: ``-le`` is an integer comparison test, not 
an arithmetic operator. The correct term is ``<=`` (See :ref:`arithmetic`). 
Correct this to find the next error, where ``$`` is prepended to the third term, 
``K--``. Since this is an (implicit) assignment statement, the ``$`` is not 
permitted. (We know that ``$K`` works in the second term, otherwise that would 
have been the second error.)

.. sidebar:: Case branching

   .. code-block:: bash

      OPT='YNmaybe'
      # OPT='dontknow'
      # OPT='whatever'
      ANS=''
      case $OPT in 
        Y*|y*)
          ANS+="positive answer\n" ;;
        *N*|*n*)
          ANS+="negative answer\n" ;;&
        *)
          ANS+="ambiguous answer\n" ;;
      esac
      echo -e -n "\e[32m$ANS\e[0m"

Case Branching
-----------------------------

Use the case statement to branch into code blocks from a set of literal choices. 
Note that multiple patterns may be used in each branch, where patterns are 
separated by the ``|`` (pipe) symbol, here used to represent *or*.

Patterns are checked in the sequence, and :command:`case` executes the code 
block for the first match. The operator ending a code block determines what 
happens after a block is executed:

+--------+---------------------------------------------+
| Oper   | Termination result                          |
+========+=============================================+
| ``;;`` | The case statement exits at ``esac``.       |
+--------+---------------------------------------------+
| ``;&`` | The next pattern's code block executes.     |
+--------+---------------------------------------------+
| ``;;&``| Pattern matching resumes at the next block. |
+--------+---------------------------------------------+

.. admonition:: Instruction

   Add the :command:`case` statements to your script from the sidebar. Test the
   script using each of the suggested values for ``OPT``. 

.. sidebar:: If branching

   .. code-block:: bash

      CHROMEVER='google-chrome-stable_current_'
      if [[ $EUID -eq 0 ]] 
      then 
        PTN='i*86'
        if [[ `uname -i` =~ $PTN ]]
        then
          CHROMEVER+='i386.deb'
        else
          CHROMEVER+='amd64.deb'
        fi
        echo -e "\e[32m $CHROMEVER \e[0m"
      else
        echo -e '\e[5;31m try again using sudo \e[0m'
      fi

if branching
-----------------------------

The :command:`if` statement is the Swiss Army Knife of logic testing. 
Comparisons may be string, numeric, or any combination thereof due to the option 
of using multiple ``elif`` sections.

.. admonition:: Instruction

   Update your script to include the sidebar code, then view the results. 
   To display results for the ``elif`` branch, run your script as ``root``::

      sudo bash ./logic-control.sh

The sample code here tests whether or not the routine is being run with ``root`` 
permissions. Then it tests a system variable to determine which generation of 
OS hardware support is installed: 32 bit, or 64 bit. The resulting string may 
be used to download and install the **Chrome** web browser from a script. 

.. note::
   In the pattern-matching test, the pattern had to be evaluated from variable 
   ``$PTN``, instead of being expressed as a string inside the test?

.. sidebar:: While & Until iterations

   .. code-block:: bash

      K=5
      while [ $K -gt 0 ]
      # until [[ $K -le 0 ]]
      do
        (( K-- ))
        echo -e "\e[32m $K squared is: $(( K ** 2 )) \e[0m"
      done

While Conditional Looping
-----------------------------

Use :command:`while` or :command:`until` to loop under control of some logical 
condition. The general distinction between :command:`for` and :command:`while` 
is this: :command:`for` is for enumerated interation, while :command:`while` 
performs conditional looping. 

.. admonition:: Instruction

   Add the sidebar commands to your script, then test the program with both the
   :command:`while` and the :command:`until` tests. For this simple example,
   the two tests are equivalent in simplicity.

.. sidebar:: Select list

   .. code-block:: bash

      select NAME in 'in' 'inn' 'ian' 'eoin'
      do
        echo -e "\e[32m $NAME \e[0m"
      done
 
Select List
-----------------------------

Use the Select List operator to display a selection menu at the terminal. This 
may not be your mama's GUI, but it offers and effective mechanism for selecting 
options in a terminal session.

.. admonition:: Instruction

   Add the select loop code from the sidebar to your script, then view the 
   results. 

.. tip::
   Use the universal break key ``^D`` (Ctrl-D) to exit the select menu, or use 
   ``^C`` (Ctrl-C) to exit the script.

Logic Test Results
=============================
   
Again, sample program results on logic tests can be viewed on a separate page: 
:ref:`logic-answers`.