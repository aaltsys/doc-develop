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
echo
echo test variable expansion in quotes
#
COMMAND='git branch -a'
echo $COMMAND
# echo '$COMMAND'
echo "$COMMAND"
#
echo
echo test command execution in parentheses
#
COMMAND='git branch -a'
# echo $( "$COMMAND" )
$( echo $COMMAND )
# $( echo '$COMMAND' )
$( echo "$COMMAND" )
#
echo
echo test command list in parentheses
#
TEXT='embedded grouped commands'
# echo $(
#   ' These statements test'
#   " $TEXT. "
# )
#
# $(
#   echo  " These statements test"
#   echo  " $TEXT. "
# )
#
echo  $(
  echo ' These statements test'
  echo " $TEXT. "
)
#
echo
echo test command group anonymous function
#
TEXT='an embedded anonymous function'
# echo  ${ 
#   echo 'These statements test'
#   echo " $TEXT. " 
# }
#
echo
echo 'test an integer calculation'
#
SEVEN=7
FIVE=5
# echo '$FIVE times $SEVEN is $(( FIVE * SEVEN ))'
echo  "$FIVE times $SEVEN is $(( FIVE * SEVEN ))"
# 
# Main code, if Valid
# 
# 
# Exit section: echo results, log errors
# 

