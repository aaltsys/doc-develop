.. _concerns:

#############################
Programming Concerns
#############################

Learning shell scripting may seem a bit esoteric. However, shell is an easy 
environment for learning important concepts in programming; concepts which are 
often overlooked in traditional programming language courses. This section will 
look at these considerations in two parts: Those items that apply to programming 
in general, and those that are specific to Linux shell scripting.

.. tip::
   System variable ``$PWD`` contains a user's Present Working Directory or path.

General Programming Concerns
=============================

.. sidebar:: Non-idempotent routine

   .. code-block:: bash

      if [ ! -d '~/Projects/dummy' ] 
      then
        mkdir -p '~/Projects/dummy'
        cd '~/Projects/dummy'
      fi
      cp '/usr/bin/m*' .

Feeling Idempotent
-----------------------------

When a routine has the same effect if it is performed multiple times as when 
it is run once, the routine is said to be **idempotent**. The typical 
:program:`hello-world.sh` program is idempotent, because the effect of the 
program does not change with multiple executions. 

Now look at the sidebar code. The first time that code is executed, files will 
be copied to new directory :file:`~/Projects/dummy`. The next time the code is 
executed, files will be copied to ``$PWD``. Ouch! If a script can be run once 
from the terminal, it may be run multiple times. Therefore every shell script 
must be tested and verified to be idempotent.

Programmers often overlook such problems, as the invoice import feature in 
:program:`QuickBooks Accounting` demonstrates. :program:`QuckBooks` creates 
additional postings for invoices with every repeated import, rather than 
posting only the first time. (And :program:`QuickBooks` is an industry 
standard?!)

.. sidebar:: Validating Paths

   .. code-block:: bash
   
        if [ ! -d .git ] ; then
          echo "No .git directory, exiting ... "
          exit 1
        else
          # set project folder to present working directory
          PROJECT=${PWD##*/}
          if [ -e '.git/description' ] 
          then cat .git/description
          fi
        fi

Keeping to the Path
-----------------------------

File paths can be problematic when writing shell scripts. A script can be copied 
from one directory to another, which may change its startup directory. Or, a 
script may be called at a directory other than the user's present working 
directory (``$PWD``). A script can be called from some other function, and 
``$PWD`` could be anything in that case. Unixes vary in their system directory 
layouts. Therefore any path or filename used in a script must be validated 
before file or directory operations. 

Some popular test logic operators for files are shown below. See 
:ref:`compare-file` for a detailed list.

+-------------+------------------------------------------------+
| Test        | File condition which returns true              |
+=============+================================================+
|  -e         | file exists                                    |
+-------------+------------------------------------------------+
|  -f         | a regular file, not a directory or device      |
+-------------+------------------------------------------------+
|  -s         | file is not zero size                          |
+-------------+------------------------------------------------+
|  -d         | file is a directory                            |
+-------------+------------------------------------------------+

.. warning::
   The consequence of not validating files and paths before performing file I/O 
   might be a broken system.

.. sidebar:: Generalized confirmation

   .. code-block:: bash

      MSG-CONFIRM='Say Hello'
      # ...
      # User Confirmation:
      # requires MSG-CONFIRM, assigns EXIT
      echo -e -n '\n\e[1;31m $MSG-CONFIRM'
      read -n 1 -p ' (y/n)?' RESP 
      echo -e '\e[0m' 
      case $RESP in
        y|Y)
          EXIT='0'
        n|N)
          EXIT='1'
        *)
          EXIT='2'
      esac

Generalize for Recycling
-----------------------------

A previous lesson presented a code snippet to obtain a user confirmation:

.. code-block:: bash

   echo -e -n '\n\e[1;31m Say Hello'
   read -n 1 -p ' (y/n)?' RESP 
   echo -e '\e[0m' 
   ...

The phrase ``Say Hello`` makes this code specific to the :program:`Hello World` 
example script. Placing the text ``Say Hello`` in a variable and assigning it 
in our variable declarations will generalize the snippet and allow it to be 
used in any script without further code changes. This will save programming and 
testing time down the road.

There are other reasons to assign strings to variables in declarations at the 
top of a program. Configuration information will be exposed in the variable 
declarations instead of being buried in the script, and changing the variable's 
language will translate the script for the user.

.. sidebar:: Reading a configuration file

   .. code-block:: bash

      # assign configuration to variables 
      # config-file lines format: VARNAME=VALUE
      # uses "printf -v NAME VALUE"
      #
      # requires FILE-CONFIG, assigns VAR-NAME, VAR-VALUE
      if [ -s "$FILE-CONFIG" ]
      then
        # read configuration into array
        SAVEIFS=$IFS
        IFS=$'\n'
        VARLIST=($(<"$FILE-CONFIG"))
        IFS=$SAVEIFS
        # assign array to named variables using printf -v
        for (( i=0; i<${#VARLIST[@]}; i++ ))
        do
          VAR-NAME=${VARLIST[i]%%=*}
          VAR-VALUE=${VARLIST[i]##*=}
          printf -v $VAR-NAME $VAR-VALUE
        done
      fi

File Configurations
-----------------------------

Many variables have meaning only in the internal context of a program. Others 
may be displayed to the user, and so language could be a concern. Then, there 
are variables which represent configuration settings for a system. We would 
want to change program configuration items without re-writing code, so 
configuration settings should be stored in a text file, and not hard coded. 

.. tip::
   Unixes store most configuration files in directory :file:`/etc/`, or as
   hidden files in the user's home directory :file:`~/`.

A common form of configuration file is structured just like variable assignment 
declarations. In fact, a program usually contains exactly the same statements 
as default variable declarations, followed by a routine to override the defaults 
with configuration values: maybe from a global file, then from a user file.

So the contents of a simple configuration file would be lines like:

.. code-block:: bash

   VARIABLE1=VALUE1
   VARIABLE2=VALUE2
   ...

The sidebar shows a generic routine to convert such a text file into assigned 
variables. 

.. note::
   A comment test is missing from the ``do .. done`` loop. This would entail 
   checking the first non-whitespace character on a line, to see if it is a 
   ``#``, or to check for blank lines. Those lines should be skipped.

Color My Words
-----------------------------

Coloring terminal output makes messages stand out. This avoids the problem of 
users ignoring important errors, or wondering why a program doesn't finish 
when prompted with ``Do this now? (Y/n)``.

Applying embedded color commands is a function of the :command:`echo` command, 
provided the ``-e`` option is included in the command. Try out the following 
commands in the terminal to see how this works.

.. code-block: bash

   export TEXT="Colorize my words"
   echo -e "\e[1;31m $TEXT \e[0m"  ; # partial quoting
   echo -e '\e[1;31m $TEXT \e[0m'  ; # full quoting
   echo "\e[1;31m $TEXT \e[0m"     ; # omitting -e option

:ref:`variables-color` documents the possible codes which are accepted at the 
terminal for changing the displayed colors.

.. note::
   Two commands for displaying text on the terminal are :command:`printf` and 
   :command:`echo`. While :command:`printf` behaves more consistently across 
   platforms, this guide will discuss :command:`echo`.

   Similarly, there are two Unix conventions for formatting terminal text: 
   embedded ``VT100 Codes``, and :command:`tput` commands. 

Readable Code
-----------------------------

Code compaction is a major source of confusion and error in programming. Shell 
scripts are particularly vulnerable to this, as a routine that is compacted into 
a single line can be pasted into the terminal and run in one step. Building a 
whole script from one-liners will just lead to confusion, however. Take the 
following command:

.. code-block:: bash

   if [[ $EUID -ne 0 ]] ; then echo -e "\e[1;31m Use sudo \e[0m" ; exit 1 ; fi

The expanded code,

.. code-block:: bash

   if [[ $EUID -ne 0 ]]
   then 
     echo -e "\e[1;31m Use sudo \e[0m"
     exit 1
   fi

is actually intelligible.

Debugging Statements
-----------------------------

Recently Bash has added a debugger, not documented here. Instead, a generic 
``echo`` command which will display the path, line number, and a message is 
shown following. Insert this message throughout a script, with appropriate 
messages, to see the results of an executed program.

.. code-block:: bash

   echo "$PWD$(tput setaf 1) $LINENO: $MSG-COMMAND $(tput sgr0)"

Note that this command does not require the ``-e`` option. Partial quoting 
(``"textstring"``) is required to evaluate embedded code in quoted text, so 
this command will not work with full quotes (``'``).
