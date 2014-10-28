#!/bin/bash
# Describe program's principal objective
# 
# Initialize variables
# 
#
# Assign parameters ($n) to named variables
# 
# User execution confirmation (location varies)
# 
# Declare repeated code functions
# 
# !! MAIN SECTION !!
# 
# Validity tests (setting exit status)
# 
# 
# Main code, if Valid
# 
echo
echo "iterative for loop"
#
echo -e -n '\e[32m'
for NAME in 'in' 'inn' 'ian' 'eoin'
do
  echo "$NAME"
done
echo -e '\e[0m'
#
echo
echo "integer for loop"
#
# for (( K=4; $K -ge 0; $K-- ))
# do
#   echo "The negative of $K squared is: $(( K * -K ))"
# done
# 
for (( K=4; $K>=0; K-- ))
do
  echo -e "\e[32m The negative of $K squared is: $(( K * -K )) \e[0m"
done
#
echo
echo "case branching test"
#
OPT='YNmaybe'
# OPT='dontknow'
# OPT='whatever'
ANS=''
case $OPT in 
  Y*|y*)
    ANS+="positive answer\n" ;;
  *N*|*n*)
    ANS+="negative answer\n" ;;&
  *)
    ANS+="ambiguous answer\n" ;;
esac
echo -e -n "\e[32m$ANS\e[0m"
#
echo
echo "if branching test"
#
CHROMEVER='google-chrome-stable_current_'
if [[ $EUID -eq 0 ]] 
then 
  PTN='i*86'
  if [[ `uname -i` =~ $PTN ]]
  then
    CHROMEVER+='i386.deb'
  else
    CHROMEVER+='amd64.deb'
  fi
  echo -e "\e[32m $CHROMEVER \e[0m"
else
  echo -e '\e[5;31m try again using sudo \e[0m'
fi
#
echo
echo "While / Until looping tests"
#
K=5
while [ $K -gt 0 ]
# until [[ $K -le 0 ]]
do
  (( K-- ))
  echo -e "\e[32m $K squared is: $(( K ** 2 )) \e[0m"
done
#
echo
echo "select loop"
#
select NAME in 'in' 'inn' 'ian' 'eoin'
do
  echo -e "\e[32m $NAME \e[0m"
done
#
# 
# Exit section: echo results, log errors
# 
