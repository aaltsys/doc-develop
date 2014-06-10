##############################
Integer Manipulation 
##############################

Bash operational signs.
===========================

Bash has 6 main operational signs ::

    + Addition
    - Subtraction
    / Division
    * Multiplication
    ** Exponentation
    % Modulo
    
They probably all seem familiar except for those last two, Exponentation and Modulo.
Exponentation is when a number is raised to that power, so 12**3 is 12*12*12
Modulo is the remainder when a Division is finished, so 13%3 is 1.

Simple Mathematical operations
================================

So, you open the terminal, type 7 + 4, and out comes 11, right? Unfortunately not. Instead you'll get "7: command not found"
Bash doesn't do math quite like your average programming language. but it does
have alternate methods which you can use.

In the Terminal
==================

.. sidebar :: Bash terminal math

    in a terminal type: ::
        THREE=3
        SEVEN=7
        NINE=4
        
    Then type ::

        echo $(($Three+$Nine+$Seven))
    
    Alternatively, to do normal math, type ::
        
        echo $[3+4+5+7*6]
        
There are different ways of performing math in a bash command line. one is to
define each variable as a number.
To do any other simple math like this simply declare a variable. 
Also note that bash does not use order of operations, 
so 2+2*2 will display as 8, not 6.
If you prefer a simpler method, you can use the square brackets.
   

The Let Command
======================

.. sidebar :: The Let Command

    type ::
    
        x=2
        x=$x+2
        echo $x
        
    type ::
    
        x=2
        let x=$x+2
        echo $x
        
    
    rather than typing: ::
    
        let x=$x+$x
    
    Type ::    

        let x=x+x
  
The let command is a built in Bash command which is useful for integer 
manipulation.At the sidebar are some examples of the let command. 
The let command can be used to simplify operations invovling integers.
As shown by the examples, the let command is useful for simple integer 
operations and arithmetic. although the let command is not necessary to perform 
mathematical operations, it is definetly a useful tool.


The Declare Command.
========================

.. sidebar :: Examples of The Declare Command

    In the terminal, type: ::
    
        n=6/3
        echo $n
        
    Useless, right? now type: ::
    
        declare -i n
        n=6/3
        echo $n
        
    The declare paired with -i tells the terminal you want n to be equal to an integer.    

The Declare Command is a useful tool if you want to set a variable to be equal to an operation or series of operations.
In the example, declare -i is used to set n to the value of 6/3, but it could also be used to set n to the value of 6/3*8%9