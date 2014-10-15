.. _operators:

#############################
Operators & Characters
#############################

Special characters [#]_
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
|| ~-       || previous working directory: corresponds to $OLDPWD              |
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

Operators and constructs
=============================

Arithmetic operators
-----------------------------

+-------------+----------------------------------------------------------------+
| Operator    | Description                                                    |
+=============+================================================================+
|  =          | equals                                                         |
+-------------+----------------------------------------------------------------+
|  \+         | plus                                                           |
+-------------+----------------------------------------------------------------+
|  \-         | minus                                                          |
+-------------+----------------------------------------------------------------+
|  \*         | multiply                                                       |
+-------------+----------------------------------------------------------------+
|  \/         | divide                                                         |
+-------------+----------------------------------------------------------------+
|  %          | modulo                                                         |
+-------------+----------------------------------------------------------------+
|  \*\*       | exponentiate                                                   |
+-------------+----------------------------------------------------------------+

Expression constructs
-----------------------------

+-------------+-----------------------------------------------------------------+
| Construct   | Description                                                     |
+=============+=================================================================+
|| (a b ... n)|| assign an array of ``n`` elements: ``array=(1 2 3 4)``         |
|| (expr...)  || group commands ``(expr1; expr2; ...)`` to execute in subshell  |
+-------------+-----------------------------------------------------------------+
| ((expr))    | double-parentheses math construct: ``var = var1 + var2``        |
+-------------+-----------------------------------------------------------------+
| $(expr)     | evaluate command expression (creates subshell)                  |
+-------------+-----------------------------------------------------------------+
| $((expr))   | evaluate an (C-style) integer arithmetic expression             |
+-------------+-----------------------------------------------------------------+
| $[3+4+5]    | evaluate an integer math expression (deprecated)                |
+-------------+-----------------------------------------------------------------+
|| {var}      || brace expansion: ``echo {1,2,3}`` shows ``1 2 3``              |
|| {02..8..2} || expand series starting ``02`` step ``2`` with ``0`` padding    |
|| { expr... }|| code block: inline group commands into local anonymous function|
+-------------+-----------------------------------------------------------------+
|| ${var:l:n} || at ``l`` from left extract ``n`` characters                    |
||            || negatives start at right, extract by position, not count       |
+-------------+-----------------------------------------------------------------+
| ${@:0}      |                                                                 |
+-------------+-----------------------------------------------------------------+
| ${!var}     | indirect reference (eval) to value of variable                  |
+-------------+-----------------------------------------------------------------+
| [ logical ] | builtin shell logical test                                      |
+-------------+-----------------------------------------------------------------+
| [[ logic ]] | shell keyword construct for logical test                        |
+-------------+-----------------------------------------------------------------+
| array[index]| (de)reference an element of an array                            |
+-------------+-----------------------------------------------------------------+
| [c d e]     | delineates a range of characters to match in regular expression |
+-------------+-----------------------------------------------------------------+
|| >          || redirect output (stdout): ``ls > filename``                    |
|| &>         || redirect errors, output (stdout, stderr): ``ls &> filename``   |
|| >&2        || redirect output to error (stdout > stderr)                     |
|| >>         || append output (stdout) to filename: ``ls >> filename``         |
|| <          || redirect input from expression: ``filename < ls``              |
|| <>         || open file and assign file descriptor: ``[i]<>filename``        |
+-------------+-----------------------------------------------------------------+
|| \|         || pipe output (stdout) of one process to input (stdin) of next   |
+-------------+-----------------------------------------------------------------+
|| <(commands)|| substitutes output of one process into another process         |
|| >(commands)||                                                                |
+-------------+-----------------------------------------------------------------+
|| &          || at end of command, detach and run command in background        |
|| &&         || linking two commands, run second iff for first, ``exit -eq 0`` |
|| \|\|       || linking two commands, run second iff for first, ``exit -ne 0`` |
+-------------+-----------------------------------------------------------------+
|| \-         || command option prefix: ``ls -al``                              |
|| \-\-       || verbose option prefix: ``ls --all --list``                     |
|| \-\-       || (builtin) end of options ``rm -- -badname*``                   |
+-------------+-----------------------------------------------------------------+

.. _comparison:

Comparison operators
=============================

String comparisons
-----------------------------

+-------------+----------------------------------------------------------------+
| Operator    | Description                                                    |
+=============+================================================================+
|| =          || is equal to (requires whitespace around operator)             |
|| ==         || is equal to, literal matching within ``[[ test ]]``           |
|| !=         || is not equal to, uses pattern matching within ``[[ test ]]``  |
|| =~         || string matches regular expression (on right) in ``[[ test ]]``|
+-------------+----------------------------------------------------------------+
|| <          || is less than in ASCII order, must be escaped in ``[ test ]``  |
|| >          || greater than in ASCII order, must be escaped in ``[ test ]``  |
+-------------+----------------------------------------------------------------+
|| -z         || is null (zero length)                                         |
|| -n         || is not null (has length > zero)                               |
+-------------+----------------------------------------------------------------+

Integer comparisons
-----------------------------

+-------------+----------------------------------------------------------------+
| Operator    | Description                                                    |
+=============+================================================================+
|  -- WITHIN TEST COMMAND (SINGLE BRACKET) OR DOUBLE BRACKETS --               |
+-------------+----------------------------------------------------------------+
| -eq         | is equal to: ``[ number1 -eq number2 ]``                       |
+-------------+----------------------------------------------------------------+
| -ne         | is not equal to: ``[ number1 -ne number2 ]``                   |
+-------------+----------------------------------------------------------------+
| -gt         | is greater than: ``[ number1 -gt number2 ]``                   |
+-------------+----------------------------------------------------------------+
| -ge         | is greater than or equal to: ``[ number1 -ge number2 ]``       |
+-------------+----------------------------------------------------------------+
| -lt         | is less than: ``[ number1 -lt number2 ]``                      |
+-------------+----------------------------------------------------------------+
| -le         | is less than or equal to: ``[ number1 -le number2 ]``          |
+-------------+----------------------------------------------------------------+
|  -- WITHIN DOUBLE PARENTHESES ONLY --                                        |
+-------------+----------------------------------------------------------------+
| =           | is equal to: ``(( number1 = expr2 ))``                         |
+-------------+----------------------------------------------------------------+
| <>          | is not equal to: ``(( number1 <> expr2 ))`` (maybe ``!=``)     |
+-------------+----------------------------------------------------------------+
| <           | is less than: ``(( number1 < expr2 ))``                        |
+-------------+----------------------------------------------------------------+
| <=          | is less than or equal to: ``(( number1 ,= expr2 ))``           |
+-------------+----------------------------------------------------------------+
| >           | is greater than: ``(( number1 > expr2 ))``                     |
+-------------+----------------------------------------------------------------+
| >=          | is greater than or equal to: ``(( number1 >= expr2 ))``        |
+-------------+----------------------------------------------------------------+

Logical comparisons
-----------------------------

+-------------+----------------------------------------------------------------+
| Operator    | Description                                                    |
+=============+================================================================+
| -a          | logical and within test command: ``[ expr1 -a expr2 ]``        |
+-------------+----------------------------------------------------------------+
| -o          | logical or within test command: ``[ expr1 -o expr2 ]``         |
+-------------+----------------------------------------------------------------+
| &&          | logical and within double brackets: ``[[ expr1 && expr2 ]]``   |
+-------------+----------------------------------------------------------------+
| \|\|        | logical or within double brackets: ``[[ expr1 || expr2 ]]``    |
+-------------+----------------------------------------------------------------+

---------

.. rubric:: Footnotes

.. [#] `Shell scripting special characters. <http://tldp.org/LDP/abs/html/special-chars.html>`_
 
