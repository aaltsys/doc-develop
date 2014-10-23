.. _logic-lesson:

#############################
Exercise 2: Logic and Control
#############################


Inputs and Logic tests
-----------------------------

.. sidebar:: Decision logic

   .. code-block:: bash

      echo -e "\n Install apt-fast?" 
      read -n 1 -p "(y/n)" RESP  
      if [ "$RESP" != 'y' ]; then
        echo -e "\n Canceled"
        exit 1
      fi

Use a read statement to get a single user response at the command line. Use this 
to have the user confirm whenever a script will permanently affect a system. 

Test all possible responses to prevent erroneous or redundant script execution.
In the sidebar example, any input other than :kbd:`y` will cause the script to 
exit. If the script had been written to exit on :kbd:`n`, then any key other 
than :kbd:`n` would result in executing the script. 

.. warning::
   It may seem obvious, but logic errors are very common when multiple responses 
   or numeric options are used, and a :command:`case` statement processes the 
   input.

Program flow control
-----------------------------

.. sidebar:: Program flow

   .. code-block:: bash

      for OPT in "$@"
      do
        case $OPT in
          -h|--help)
            display-help
            exit
            ;;
          -n|--nodeploy)
            NODEPLOY='YES'
            shift
            ;;
          *)
            PROJECT=$OPT
            shift
            ;;
        esac
      done

Speaking of case statements, the sidebar code demonstrates how a relatively 
complex task, reading and processing a list of items entered in arbitrary order, 
can be addressed with a case branching test enveloped within a looping control. 
Let's break this down. 

*  The expression ``$@`` is an array of all input parameters, ``$1 ... $n``.  
*  The first statement, ``for OPT in "$@"``, iteratively assigns elements of 
   ``$@`` to variable ``OPT``.
*  The second and last statements, ``do ... done``, bound the statements to be 
   iterated with respect to ``OPT``.
*  The statement ``case $OPT in`` specifies to test the values of ``OPT``.
*  Each test ends with a closing parenthesis ``)``. The tests are,
   #. -h or --help: display help, then exit
   #. -n or --nodeploy: set variable NODEPLOY='YES'
   #. Any other input: assign the input value to variable ``PROJECT``