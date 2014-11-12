.. _methods:

#############################
Methods for Objectives
#############################


Highly quotable
-----------------------------

Partial quoting (\"``textstring``\") is required to evaluate embedded code in 
quoted text. 

Colorful language 
-----------------------------



Embedded color commands, are a function of the :command:`echo` command, however,
and the option ``-e`` is required to translate the colors. 

TEXT="Color my words"
echo -e "\e[1;31m $TEXT \e[0m"  ; # partial quoting
echo -e '\e[1;31m $TEXT \e[0m'  ; # full quoting
echo "\e[1;31m $TEXT \e[0m"     ; # omitting -e option



if [[ $EUID -ne 0 ]] ; then echo -e "\e[1;31m try again using sudo \e[0m" ; exit 1 ; fi