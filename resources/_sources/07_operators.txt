.. _operators:

#############################
Operators & Other Characters
#############################

.. _arithmetic:

Arithmetic operators
=============================

.. note::
   The arithmetic operators are listed grouped in order of precedence. 

+-----------------+---------------------------------------------------------+
| Operator        | Description                                             |
+=================+=========================================================+
|| ``id++``       || post-increment                                         |
|| ``id--``       || post-decrement                                         |
+-----------------+---------------------------------------------------------+
|| ``++id``       || pre-increment                                          |
|| ``--id``       || pre-decrement                                          |
+-----------------+---------------------------------------------------------+
|| ``+``          || unary plus (positive number)                           |
|| ``-``          || unary minus (negative number)                          |
+-----------------+---------------------------------------------------------+
|| ``!``          || logical negation                                       |
|| ``~``          || bit-wise negation                                      |
+-----------------+---------------------------------------------------------+
|  ``**``         | exponentiation                                          |
+-----------------+---------------------------------------------------------+
|| ``*``          || multiplication                                         |
|| ``/``          || division                                               |
|| ``%``          || remainder (modulus)                                    |
+-----------------+---------------------------------------------------------+
|| ``+``          || addition                                               |
|| ``-``          || subtraction                                            |
+-----------------+---------------------------------------------------------+
|| ``<<``         || bit-wise shift left                                    |
|| ``>>``         || bit-wise shift right                                   |
+-----------------+---------------------------------------------------------+
|| ``<=``         || comparison less than or equal to                       |
|| ``>=``         || comparison greater than or equal to                    |
|| ``<``          || comparison less than                                   |
|| ``>``          || comparison greater than                                |
+-----------------+---------------------------------------------------------+
|| ``==``         || equality                                               |
|| ``!=``         || inequality                                             |
+-----------------+---------------------------------------------------------+
|  ``&``          | bit-wise AND                                            |
+-----------------+---------------------------------------------------------+
|  ``^``          | bit-wise XOR (exclusive or)                             |
+-----------------+---------------------------------------------------------+
|  ``|``          | bit-wise OR                                             |
+-----------------+---------------------------------------------------------+
|  ``&&``         | logical AND                                             |
+-----------------+---------------------------------------------------------+
|  ``||``         | logical OR                                              |
+-----------------+---------------------------------------------------------+
| expr?expr:expr  | conditional operator                                    |
+-----------------+---------------------------------------------------------+
| assignment      | (see following table)                                   |
+-----------------+---------------------------------------------------------+
| expr1 , expr2   | comma assignment                                        |
+-----------------+---------------------------------------------------------+

Arithmetic assignment
-----------------------------

+----------+----------------------------------------------------------------+
| Operator | Description                                                    |
+==========+================================================================+
| ``=``    | Assign expression to variable: variable=expression             |
+----------+----------------------------------------------------------------+
| ``*=``   | Assign product of expression multiplied by variable            |
+----------+----------------------------------------------------------------+
| ``/=``   | Assign dividend                                                |
+----------+----------------------------------------------------------------+
| ``%=``   | Assign remainer                                                |
+----------+----------------------------------------------------------------+
| ``+=``   | Assign sum                                                     |
+----------+----------------------------------------------------------------+
| ``-=``   | Assign difference                                              |
+----------+----------------------------------------------------------------+
| ``<<=``  | assign bit-wise left shift                                     |
+----------+----------------------------------------------------------------+
| ``>>=``  | assign bit-wise right shift                                    |
+----------+----------------------------------------------------------------+
| ``&=``   | assign bitwise AND                                             |
+----------+----------------------------------------------------------------+
| ``^=``   | assign bit-wise XOR exclusive or                               |
+----------+----------------------------------------------------------------+
| ``|=``   | assign bit-wise OR                                             |
+----------+----------------------------------------------------------------+

.. seealso::

   Online documentation at ``man bash``.

.. _logic:

Logic Operators
=============================

.. note::

   +---------------------------------------------------------------------------+
   |      Legend                                                               |
   +========+==================================================================+
   | Test   | Column **Test** indicates which type of logic test this          |
   |        | operator applies to. Values might be ``[``, ``[[`` or ``all``.   |
   +--------+------------------------------------------------------------------+
   | U/B    | The **U/B** column refers to the type of test: ``U`` for         |
   |        | *unary*, or ``B`` for *binary*.                                  |
   +--------+------------------------------------------------------------------+

Logical reversal operator
-----------------------------

+----------+-------+-----+-----------------------------------------------------+
| Operator | Test  | U/B | Description                                         |
+==========+=======+=====+=====================================================+
| ``!``    |  all  |  U  | "not" -- reverses the sense of a logical operation  |
+----------+-------+-----+-----------------------------------------------------+

Compound comparison operators
-----------------------------

+----------+-------+-----+-----------------------------------------------------+
| Operator | Test  | U/B | Description                                         |
+==========+=======+=====+=====================================================+
| ``-a``   | ``[`` |  B  | logical AND within test: ``[ expr1 -a expr2 ]``     |
+----------+-------+-----+-----------------------------------------------------+
| ``-o``   | ``[`` |  B  | logical OR within test: ``[ expr1 -o expr2 ]``      |
+----------+-------+-----+-----------------------------------------------------+
| ``&&``   | ``[[``|  B  | logical AND double-bracket: ``[[ expr1 && expr2 ]]``|
+----------+-------+-----+-----------------------------------------------------+
| ``||``   | ``[[``|  B  | logical OR double-bracket: ``[[ expr1 || expr2 ]]`` |
+----------+-------+-----+-----------------------------------------------------+

Comparison Tests
=============================

Generally, comparison tests are of three types: string comparisons, integer 
comparisons, and file status tests.

.. _compare-string:

String comparisons
-----------------------------

+----------+-------+-----+-----------------------------------------------------+
| Operator | Test  | U/B | Description                                         |
+==========+=======+=====+=====================================================+
|  ``=``   |  all  |  B  | equal to, literal matching, whitespace req'd        |
+----------+-------+-----+-----------------------------------------------------+
|  ``==``  | ``[`` |  B  | equal to, within test, synonym for ``=``            |
+----------+-------+-----+-----------------------------------------------------+
|  ``==``  | ``[[``|  B  | equal to, double-bracket, pattern matching, see (2) |
+----------+-------+-----+-----------------------------------------------------+
|  ``!=``  | ``[`` |  B  | not equal to, within test, whitespace req'd         |
+----------+-------+-----+-----------------------------------------------------+
|  ``!=``  | ``[[``|  B  | not equal to, double-bracket, pattern matching, (2) |
+----------+-------+-----+-----------------------------------------------------+
|  ``=~``  | ``[[``|  B  | matches, double-bracket, pattern matching, see (2)  |
+----------+-------+-----+-----------------------------------------------------+
|  ``<``   |  all  |  B  | less than, escape req'd in ``[``, see (1)           |
+----------+-------+-----+-----------------------------------------------------+
|  ``>``   |  all  |  B  | greater than, escape req'd in ``[``, see (1)        |
+----------+-------+-----+-----------------------------------------------------+
|  ``-z``  |  all  |  U  | null (zero length)                                  |
+----------+-------+-----+-----------------------------------------------------+
|  ``-n``  |  all  |  U  | not null (length > zero), quotes req'd in ``[``     |
+----------+-------+-----+-----------------------------------------------------+

.. note::
   #. Lexicographical sort order for ``test`` or ``[`` construct is ASCII; 
      for ``[[`` construct the ordering is determined using the current locale.
   #. Construct ``[[`` uses ``==``, ``!=``, and ``=~`` to match by pattern, with
      the pattern on the right. See :ref:`glob`.

.. _compare-math:

Integer comparisons
-----------------------------

+----------+-------+-----+-----------------------------------------------------+
| Operator | Test  | U/B | Description                                         |
+==========+=======+=====+=====================================================+
| ``-eq``  | ``[`` |  B  | equal to: ``[ number1 -eq number2 ]``               |
+----------+-------+-----+-----------------------------------------------------+
| ``-ne``  | ``[`` |  B  | not equal to: ``[ number1 -ne number2 ]``           |
+----------+-------+-----+-----------------------------------------------------+
| ``-gt``  | ``[`` |  B  | greater than: ``[ number1 -gt number2 ]``           |
+----------+-------+-----+-----------------------------------------------------+
| ``-ge``  | ``[`` |  B  | greater than/equal to: ``[ number1 -ge number2 ]``  |
+----------+-------+-----+-----------------------------------------------------+
| ``-lt``  | ``[`` |  B  | less than: ``[ number1 -lt number2 ]``              |
+----------+-------+-----+-----------------------------------------------------+
| ``-le``  | ``[`` |  B  | less than/equal to: ``[ number1 -le number2 ]``     |
+----------+-------+-----+-----------------------------------------------------+
| ``=``    | ``[[``|  B  | equal to: ``(( number1 = expr2 ))``                 |
+----------+-------+-----+-----------------------------------------------------+
| ``!=``   | ``[[``|  B  | not equal to: ``(( number1 <> expr2 ))``            |
+----------+-------+-----+-----------------------------------------------------+
| ``<``    | ``[[``|  B  | less than: ``(( number1 < expr2 ))``                |
+----------+-------+-----+-----------------------------------------------------+
| ``<=``   | ``[[``|  B  | less than or equal to: ``(( number1 ,= expr2 ))``   |
+----------+-------+-----+-----------------------------------------------------+
| ``>``    | ``[[``|  B  | greater than: ``(( number1 > expr2 ))``             |
+----------+-------+-----+-----------------------------------------------------+
| ``>=``   | ``[[``|  B  | greater than or equal to: ``(( number1 >= expr2 ))``|
+----------+-------+-----+-----------------------------------------------------+

.. _compare-file:

File test operators
-----------------------------

+----------+-------+-----+-----------------------------------------------------+
| Operator | Test  | U/B | Description                                         |
+==========+=======+=====+=====================================================+
|| -e      || all  || U  || file exists                                        |
|| -a      ||      || U  || file exists (deprecated usage)                     |
+----------+-------+-----+-----------------------------------------------------+
|  -f      |  all  |  U  | a regular file (not a directory or device file)     |
+----------+-------+-----+-----------------------------------------------------+
|  -s      |  all  |  U  | file is not zero size                               |
+----------+-------+-----+-----------------------------------------------------+
|  -d      |  all  |  U  | file is a directory                                 |
+----------+-------+-----+-----------------------------------------------------+
|  -b      |  all  |  U  | file is a block device                              |
+----------+-------+-----+-----------------------------------------------------+
|  -c      |  all  |  U  | file is a character device                          |
+----------+-------+-----+-----------------------------------------------------+
|  -p      |  all  |  U  | file is a pipe                                      |
+----------+-------+-----+-----------------------------------------------------+
|| -h      || all  || U  || file is a symbolic link                            |
|| -L      || all  || U  || file is a symbolic link                            |
+----------+-------+-----+-----------------------------------------------------+
|  -S      |  all  |  U  | file is a socket                                    |
+----------+-------+-----+-----------------------------------------------------+
|  -t      || all  || U  || file (descriptor) is associated with a terminal.   |
|          ||      ||    || In a script, this test option can check whether the|
|          ||      ||    || stdin [ -t 0 ] or stdout [ -t 1 ] is a terminal.   |
+----------+-------+-----+-----------------------------------------------------+
|  -r      |  all  |  U  | file has read permission (for user running test)    |
+----------+-------+-----+-----------------------------------------------------+
|  -w      |  all  |  U  | file has write permission (for user running test)   |
+----------+-------+-----+-----------------------------------------------------+
|  -x      |  all  |  U  | file has execute permission (for user running test) |
+----------+-------+-----+-----------------------------------------------------+
|  -g      || all  || U  || set-group-id (sgid) flag set on file or directory. |
|          ||      ||    || When sgid flag is set on a directory, files created|
|          ||      ||    || in that directory belong to the group that owns the|
|          ||      ||    || directory, not to the creating user's group.       |
+----------+-------+-----+-----------------------------------------------------+
|  -u      |  all  |  U  | set-user-id (suid) flag set on file                 |
+----------+-------+-----+-----------------------------------------------------+
|  -k      |  all  |  U  | sticky bit set                                      |
+----------+-------+-----+-----------------------------------------------------+
|  -O      |  all  |  U  | you are owner of file                               |
+----------+-------+-----+-----------------------------------------------------+
|  -G      |  all  |  U  | group-id of file same as yours                      |
+----------+-------+-----+-----------------------------------------------------+
|  -N      |  all  |  U  | file modified since it was last read                |
+----------+-------+-----+-----------------------------------------------------+
| f1 -nt f2|  all  |  B  | file f1 is newer than f2                            |
+----------+-------+-----+-----------------------------------------------------+
| f1 -ot f2|  all  |  B  | file f1 is older than f2                            |
+----------+-------+-----+-----------------------------------------------------+
| f1 -ef f2|  all  |  B  | files f1 and f2 are hard links to the same file     |
+----------+-------+-----+-----------------------------------------------------+

.. seealso::

   `Advanced Bash Scripting Guide <http://tldp.org/LDP/abs/html/fto.html>`_

.. _constructs:

Expression constructs
=============================

+-------------+-----------------------------------------------------------------+
| Construct   | Description                                                     |
+=============+=================================================================+
|| (a b ... n)|| assign an array of ``n`` elements: ``array=(1 2 3 4)``         |
|| (expr...)  || group commands ``(expr1; expr2; ...)`` to execute in subshell  |
+-------------+-----------------------------------------------------------------+
| ((math))    | double-parentheses math construct: ``var = var1 + var2``        |
+-------------+-----------------------------------------------------------------+
| ${var}      | evaluate a string variable                                      |
+-------------+-----------------------------------------------------------------+
| $(expr)     | evaluate command expression (creates subshell)                  |
+-------------+-----------------------------------------------------------------+
| $((math))   | evaluate an integer arithmetic expression (C-style)             |
+-------------+-----------------------------------------------------------------+
| \`expr\`    | evaluate a command, original Bourne notation (deprecated)       |
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
| ${!var}     | indirect reference (eval) to value of variable                  |
+-------------+-----------------------------------------------------------------+
| [ logical ] | builtin shell logical test (``[`` is the "test" operator)       |
+-------------+-----------------------------------------------------------------+
| [[ logic ]] | shell keyword construct for logical test                        |
+-------------+-----------------------------------------------------------------+
| array[index]| (de)reference an element of an array                            |
+-------------+-----------------------------------------------------------------+
| [c d e]     | delineates a range of characters to match in regular expression |
+-------------+-----------------------------------------------------------------+
|| ``>``      || redirect output (stdout): ``ls > filename``                    |
|| ``&>``     || redirect errors, output (stdout, stderr): ``ls &> filename``   |
|| ``>&2``    || redirect output to error (stdout > stderr)                     |
|| ``>>``     || append output (stdout) to filename: ``ls >> filename``         |
|| ``<``      || redirect input from expression: ``filename < ls``              |
|| ``<>``     || open file and assign file descriptor: ``[i]<>filename``        |
+-------------+-----------------------------------------------------------------+
|| ``|``      || pipe output (stdout) of one process to input (stdin) of next   |
+-------------+-----------------------------------------------------------------+
|| <(commands)|| substitutes output of one process into another process         |
|| >(commands)||                                                                |
+-------------+-----------------------------------------------------------------+
|| ``&``      || at end of command, detach and run command in background        |
|| ``&&``     || linking two commands, run second iff for first, ``exit -eq 0`` |
|| ``|``      || linking two commands, run second iff for first, ``exit -ne 0`` |
+-------------+-----------------------------------------------------------------+
|| ``-``      || command option prefix: ``ls -al``                              |
|| ``--``     || verbose option prefix: ``ls --all --list``                     |
|| ``--``     || (builtin) end of options ``rm -- -badname*``                   |
+-------------+-----------------------------------------------------------------+

.. _glob:

Glob Pattern Matching
=============================

Some entries, such as file system paths, may be written as expressions to be 
expanded by substitution and pattern matching. 

+----------------+-----------------------------------------------------------+
| Expression     | Interpretation                                            |
+================+===========================================================+
| ``*``          | any string of 0 or more characters                        |
+----------------+-----------------------------------------------------------+
| ``?``          | any string of 0 or 1 character                            |
+----------------+-----------------------------------------------------------+
| ``X`` or ``\X``| where ``X`` represents any (special) character            |
+----------------+-----------------------------------------------------------+
|  ``[XYZ]``     | where ``XYZ`` is a set of permitted characters            |
+----------------+-----------------------------------------------------------+
|  ``[x..z]``    | where ``x..z`` is a range of permitted characters         |
+----------------+-----------------------------------------------------------+

.. _characters:

Special characters 
=============================

+-----------+------------------------------------------------------------------+
| Character |                                                                  |
+===========+==================================================================+
|| \"X\"    || partial quoting interprets embedded expressions (quotes)        |
|| \'X\'    || full quoting preserves literal contents of text                 |
|| \\X      || escape single character to display literal value (like ``'X'``) |
|| \`X\`    || back-tick quote command to assign output to a variable          |
+-----------+------------------------------------------------------------------+
|  !        | negates a conditional test result or exit status                 |
+-----------+------------------------------------------------------------------+
|  :        | synonym for ``true`` conditional result                          |
+-----------+------------------------------------------------------------------+
|| ;        || semicolons separate commands appearing on one line:             |
||          ||    ``if [ -x "$filename" ] ; then cp $filename $dir/ ; fi``     |
+-----------+------------------------------------------------------------------+
|  #        | ``#`` after a newline or a command separator denotes a comment   |
+-----------+------------------------------------------------------------------+
||  ;;      || double-semicolons terminate an option in case statements        |
||          ||   ``case "$variable" in``                                       |
||  ;;&     ||     ``abc)  echo "\$variable = abc" ;;``                        |
||  ;&      ||     ``xyz)  echo "\$variable = xyz" ;;``                        |
||          ||   ``esac``                                                      |
+-----------+------------------------------------------------------------------+
|| .        || period by itself indicates a source                             |
|| .filename|| period as a filename prefix indicates a hidden file             |
|| . or ./  || directory name ``.`` represents the working directory ``PWD``   |
|| ..       || directory ``..`` represents the parent directory of ``PWD``     |
|| \/       || file path directory separator (forward slash)                   |
+-----------+------------------------------------------------------------------+
|| \*       || return all visible files in the current directory               |
|| \*text   || return all files ending in "text" in current directory          |
|| \*\*     || recursively return files in directory tree (shopt -s globstar)  |
|| ,        || concatenate string results: ``for file in /{,usr/}bin/*calc``   |
+-----------+------------------------------------------------------------------+
|| ~        || user home directory path: corresponds to $HOME                  |
|| ~+       || present working directory: corresponds to $PWD                  |
|| ~\-      || previous working directory: corresponds to $OLDPWD              |
+-----------+------------------------------------------------------------------+
|| \^       || parameter substitution: ``echo ${var^}`` uppercase first char   |
|| \^\^     || parameter substitution: ``echo ${var^^}`` uppercase string      |
|| ,        || parameter substitution: ``echo ${var,}`` lowercase first char   |
|| ,,       || parameter substitution: ``echo ${var,,}`` lowercase string      |
+-----------+------------------------------------------------------------------+
|| ?        || in globbing and regex, represents a single wild-card character  |
||          || operator in double-parentheses construct, parameter substitution|
+-----------+------------------------------------------------------------------+
|| $        || in a regular expression, ``$`` represents end of line of text   |
|| ${}      || in parameter substitution, evaluates a variable or expression   |
|| $' ..'   || in quoted string, expands octal/hex values into ASCII/Unicode   |
|| $n       || the n-th positional parameter input to a command or script      |
|| \"$\*\"  || all positional parameters, seen together as single word         |
|| \"$@\"   || list of positional parameters, each one quoted                  |
|| $?       || exit status of a command, function, or script                   |
|| $$       || process id of running script                                    |
+-----------+------------------------------------------------------------------+

.. seealso::

   `Shell scripting special characters. <http://tldp.org/LDP/abs/html/special-chars.html>`_
 
