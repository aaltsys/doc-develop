.. _expressions:

#############################
Routines and Expressions
#############################

Logical expression blocks
=============================

::

   for name in [wordlist] 
   do
     command list
   done

::

   for (( expr1; expr2; ... ))
   do
      command list
   done

::

   while [ logical expr ]
   do
     command list
   done

::
 
   until [ logical expr ]
   do
     command list
   done

::
 
   case "$variable" in
     value1)
       command list ;;
     value2)
       command list ;;
   esac

::

   if [ logical expr ] 
   then
     command list
   elif [ logical expr ]
   then
     command list
   else
     command list
   fi

::



::