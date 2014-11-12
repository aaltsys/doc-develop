.. _expressions:

#############################
Routines and Expressions
#############################

Logical expression blocks
=============================

.. code-block:: bash

   for name in [wordlist] 
   do
     command list
   done

.. code-block:: bash

   for (( expr1; expr2; ... ))
   do
      command list
   done

.. code-block:: bash

   while [ logical expr ]
   do
     command list
   done

.. code-block:: bash
 
   until [ logical expr ]
   do
     command list
   done

.. code-block:: bash
 
   case "$variable" in
     value1)
       command list ;;
     value2)
       command list ;;
   esac

.. code-block:: bash

   if [ logical expr ] 
   then
     command list
   elif [ logical expr ]
   then
     command list
   else
     command list
   fi

.. _arithmetic_eval:

Arithmetic Evaluation
=============================

Under certain circumstances, the shell evaluates arithmetic expressions in 
fixed-width integers with no check for overflow, though division by 0 is trapped 
and flagged as an error. The operators and their precedence, associativity, and 
values are the same as in the C language. :ref:`arithmetic` and arithmetic 
assignment expressions are listed separately.

Shell variables are allowed operands in arithmetic expressions, and parameter 
expansion is performed before the expression is evaluated. Within an expression, 
shell variables may be referenced by name without using the parameter expansion 
syntax. A shell variable that is null or unset evaluates to 0 when referenced by 
name without using the parameter expansion syntax. The value of a variable is 
evaluated as an arithmetic expression when it is referenced, or when a variable 
which has been given the integer attribute using declare -i is assigned a value. 
A shell variable need not have its integer attribute turned on to be used in an 
expression.

Constants with a leading 0 are interpreted as octal numbers. A leading 0x or 0X 
denotes hexadecimal. Otherwise, numbers take the form [base#]n, where the 
optional base is a decimal number between 2 and 64 representing the arithmetic 
base, and n is a number in that base. If base# is omitted, then base 10 is used. 
When specifying n, the digits greater than 9 are represented by the lowercase 
letters, the uppercase letters, @, and _, in that order. If base is less than or 
equal to 36, lowercase and uppercase letters may be used interchangeably to 
represent numbers between 10 and 35.

Operators are evaluated in order of precedence. Sub-expressions in parentheses 
are evaluated first and may override the precedence rules.
