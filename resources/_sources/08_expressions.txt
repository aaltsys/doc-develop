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

   # assigning an array to variables using "printf -v VARNAME VALUE"
   if [[ -s "$VARS-FILE" ]]
   then
     SAVEIFS=$IFS
     IFS=$'\n'
     VARLIST=($(<"$VARS-FILE"))
     IFS=$SAVEIFS
     # assign array to named variables using printf --
     for (( i=0; i<${#VARLIST[@]}; i++ ))
     do
       VAR-NAME=${VARLIST[i]%%=*}
       VAR-VALUE=${VARLIST[i]##*=}
       printf -v $VAR-NAME $VAR-VALUE
     done
   fi

::