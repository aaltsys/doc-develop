#############################
Logic Statements in bash
#############################

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
