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
echo "$(tput setaf 2)"
for NAME in 'in' 'inn' 'ian' 'eoin'
do
  echo "$NAME"
done
echo "$(tput sgr0)"
#
echo
echo "integer for loop"
#
# for (( K=4; $K -ge 0; $K-- ))
# do
#   echo "The negative of $K squared is: $(( K * -K ))"
# done
# 
for $(( I=4; $I>=0; I-- ))
do
  echo  "$(tput setaf 2) The negative of $K squared is: $(( K * -K )) $(tput sgr0)"
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
    ANS+="positive answer" ;;
  *N*|*n*)
    ANS+="negative answer" ;;&
  *)
    ANS+="ambiguous answer" ;;
esac
echo  "$(tput setaf 2)$ANS$(tput sgr0)"
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
  echo  "$(tput setaf 2) $CHROMEVER $(tput sgr0)"
else
  echo  "$(tput setaf 1) try again using sudo $(tput sgr0)"
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
  echo -e "$(tput setaf 2) $K squared is: $(( K ** 2 )) $(tput sgr0)"
done
#
echo
echo "select loop"
#
select NAME in 'in' 'inn' 'ian' 'eoin' 
do
  echo  "$(tput setaf 2) $NAME $(tput sgr0)"
break
done

#
# 
# Exit section: echo results, log errors
# 
