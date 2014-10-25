.. _configure-lesson: 

#############################

#############################



Attending Conventions
=============================

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

The sidebar code here demonstrates how a relatively complex task, reading and 
processing a list of items entered in arbitrary order, might be addressed with 
a complex program design. Here a compound statement, the ``for..do..done`` 
looping control, envelopes another compound statement, the ``case..test..esac``
logical test and assignment. Let's break this down. 

*  The expression ``$@`` is an array of all input parameters, ``$1 ... $n``.  
*  The first statement, ``for OPT in "$@"``, iteratively assigns elements of 
   ``$@`` to variable ``OPT``.
*  The second and last statements, ``do ... done``, bound the statements to be 
   iterated with respect to ``OPT``.
*  The statement ``case $OPT in`` specifies to test the values of ``OPT``.
*  Each test ends with a closing parenthesis ``)``. The tests are,

   #. ``-h`` or ``--help``: display help, then exit
   #. ``-n`` or ``--nodeploy``: set variable ``NODEPLOY='YES'``
   #. Any other input: assign the input value to variable ``PROJECT``

.. warning::
   It may seem obvious, but logic errors are very common when multiple responses 
   or numeric options are used, and a :command:`case` statement processes the 
   input.
