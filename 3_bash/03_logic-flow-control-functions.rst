############################# 
Logic Flow Control Functions
#############################

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