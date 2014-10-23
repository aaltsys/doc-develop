.. _methods:

#############################
Reusable Method Code
#############################

Get User Confirmation
=============================

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

Assign Variables from File
=============================

.. code-block:: bash

   # assign configuration to variables 
   # config-file lines format: VAR-NAME=VAR-VALUE
   # uses "printf -v VAR-NAME VAR-VALUE"
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

Here Document
=============================

.. code-block:: bash

   <<-docname
      here-document statements
      ...
   docname