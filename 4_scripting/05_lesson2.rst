.. _logic-lesson:

#############################
Exercise 2: Logic and Control
#############################

Expanding Commands
=============================


String Commands
=============================

$()
-----------------------------

${}
------------------------------


Quotes
=============================

Single vs Double Quotes
-----------------------------

+--------------------------------+-----------------------------------------+
| ``echo $(git branch -a)``      | garbage                                 |
+--------------------------------+-----------------------------------------+
| ``echo '$(git branch -a)'``    | ``git branch -a``                       |
+--------------------------------+-----------------------------------------+
| ``echo "$(git branch -a)"``    | expected output of git branch command   |
+--------------------------------+-----------------------------------------+


Programming with Logic
=============================

This lesson focuses on assembling a program with compound logic commands. First 
start a new program, call it ``control-logic.sh``. Remember, copy in the 
example shell outline or download it from :download:``_downloads/example.sh`.

... With Iterative For
-----------------------------

For OPT in NAMELIST
do
  Commands
Done

... With Integer For
-----------------------------

for (( expression1 ; expression2 ; expression3 ))
do
  command list
done

... With Select List
-----------------------------

select name [ in word ]
do
  command list
done

... With Case Branching
-----------------------------

case word in 
  pattern|pattern)
    command list ;;
  pattern2|pattern2)
    command list ;;
  *)
    command list ;;
esac

... With if branching
-----------------------------

if expression list
then
  command list ;
elif expression list
then
  command list ;
  ...
else expression list
  command list ;
fi

Prompt user to escalate privileges::

   if [[ $EUID -ne 0 ]] ; then echo -e "\e[1;31m try again using sudo \e[0m" ; exit 1 ; fi

Select an optional value and concatenate it based on a system setting::

   CHROMEVER='google-chrome-stable_current_'
   if [ "`uname -i`" = "i386" ] 
   then
     CHROMEVER+='i386.deb'
   else
     CHROMEVER+='amd64.deb'
   fi

Either add or change a configuration setting in a file using programmatic control::

   if [[ -z "$(grep 'vm.mmap_min_addr' /etc/modules)" ]] ; then 
      echo -e /n "vm.mmap_min_addr=0" >> /etc/modules ;
   else
      sed -i '/vm.mmap_min_addr/c\vn.mmap_min_addr=0' ~/etc/modules ;
   fi


... With Iterative While
-----------------------------

while expression list
do
  command list
done




########################
========================


