#! /bin/bash
# My first script, presenting programming to the world
# 
# Initialize variables
DISPLAY='World'
EXIT='0'
RESP='n'
# 
# Assign parameters ($n) to named variables
# if [$1 != '']      ; # fails without spaces around [ ]
# if [ $1 != '' ]    ; # works with !# and single [ ]
# if [ ! $1 == '' ]  ; # works to (!) negate the expression
if [[ $1 != '' ]]    ; # works w/ single [ and double [[ 
then DISPLAY=$1
fi
# 
# User execution confirmation (location varies)
# echo "Say Hello?" 
# echo "\n\e[1;31m Say Hello?"
echo -e -n '\n\e[1;31m Say Hello'
read -n 1 -p ' (y/n)?' RESP 
echo -e '\e[0m'
case $RESP in
  y|Y)
    EXIT='0' ;;
  n|N)
    EXIT='1' ;;
  *)
    EXIT='2' ;;
esac
# 
# Declare repeated code functions (none declared)
# 
# !! MAIN SECTION !!
# 
# Validity tests (setting exit status)
# 
# Main code, if Valid
# 
# Exit section: echo results, log errors
# echo 'Hello World'
# echo 'Hello DISPLAY'  ; # full quoting
# echo "hello DISPLAY"  ; # partial quoting
# echo 'Hello $DISPLAY' ; # $-operator for evaluation
# echo "Hello $DISPLAY" ; # $ evaluation in partial quotes

# exit statements with user message display
case $EXIT in
  '0' )
    # echo -e "\nHello $DISPLAY" ;;
    echo -e "\n\e[1;32m Hello $DISPLAY \e[0m\n" ;;
  * )
    # echo -e "\nCanceled" ;;
    echo -e "\n\e[1;31m Canceled \e[0m\n" ;;
esac

exit $EXIT
# 
