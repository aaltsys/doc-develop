################################# 
Logic Flow Control Functions
#################################

Wow. Logic Flow Control Functions. That's a big name. looks complicated, right?
Not terribly.

If Else Statements
=====================

IF Else statements take on 1 of 4 forms. 


Form 1: ::

     if *condition* ; then
        *commands*
     fi

Form 2: ::

    if *condition* ; then
        *commands*
    else
        *commands*
    fi
    
Form 3: ::

    if *condition* ; then
        *commands* 
    elif *condition* ; then
          *commands*
    fi
    
Form 4: ::

    if *condition* ; then
        *commands* 
    elif *condition* ; then
          *commands*
    else
        *commands*
    fi    
    
Each if else statement has a specific purpose. 

In the first one, the statement checks for a condition, and if the condition is true, it performs an action. otherwise, it does nothing

In the second, the statement checks for a condition, and if the condition is true, performs an action. if the condition is false, it performs a different action.

In the third, the statement checks for a condition, and if it is true, performs an action. if the first condition is false, but the second condition is true, it performs a different action. if neither condition is true, it does nothing. (note that this could be extended to 5, 20, or even a hundred different conditions.)

In the fourth, the statement checks for a condition, and if it is true, performs an action. if the first condition is false but the second condition is true, it performs a different action. if none of the conditions are true, it performs a different action.(once again, there could be more than 2 conditions)

For/While/Until Loops in bash.
===================================

This section deals with three types of loops. The while loop. the until loop. and the for loop.

The While Loop
-------------------

.. sidebar :: Avoiding Infinite Loops.

    Try to avoid Infininte loops whenever possible. An example of an Infininte Loop is ::
     
        number=0
        while [ $number -lt 10 ]; do
            echo "Number = $number"
            number=$((number - 1))
        done
    
    You'll notice that Even though it has a condition, it sends it down, not up, meaning it will endlessly spiral downwards away from 10.    

The while loop is used to perform an action for as long as a condition is met. for example ::

    number=0
    while [ $number -lt 10 ]; do
        echo "Number = $number"
        number=$((number + 1))
    done
    
In this example, a number is set to 0, and for as long as the number is less than 10(the -lt is less than), the value of the number is printed, and 1 is added to the number.
as soon as the number reaches 10, the code stops performing

The Until Loop
---------------------

The Until Loop is a lot like the while loop, except contrary to the while loop, instead of carrying out a piece of code while a condition is true, it carries out a piece of code while a condition is false.
Here's an example of an Until Loop ::

    number=0
    until [ $number -ge 10 ]; do
        echo "Number = $number"
        number=$((number + 1))
    done
    
In this example, you'll notice that until the number is greater than or equal to 10(-ge is greater than or equal to), it echoes the number's value and adds 1.  

The For Loop
----------------

the for loop is