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
#! /bin/bash
# My first script, presenting programming to the world
# 
# Initialize variables
DISPLAY='World'
# 
# Assign parameters ($n) to named variables
# if [! $1 = ''] && [-n $1]    ; # fails without spaces around [ ]
# if [ $1 != '' ] && [ -n $1]   ; # works with !# and single [ ]
# if [ ! $1 == '' ] && [ -n $1]  ; # works to (!) negate the expression
if [ -n $1 ] && [ ! $1 = '' ]   ; # works w/ single [ and double [[ 
then DISPLAY=$1
fi
# 
# User execution confirmation (location varies)
# echo "Say Hello?" 
# echo "\n\e[1;31m Say Hello?"
echo  "Run this script? (y/n) "
read RESP
if [ "$RESP" != 'y' ]; then
  echo "Canceled"
  exit 1
fi
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
echo "Hello $DISPLAY"
# 

