#############################
Variables
#############################

:orphan:

Variable Types
================

There are several different variable types in bash.

+ Declared Local Variables
+ Environment Variables
+ Exported Variables

Declared Variables
=====================

.. sidebar:: Example Declared Variable ::
  
      THISVARIABLE="A string"
  
  The value dan be changed by re-declaring it. ::
      THISVARIABLE="a new string"

Declared Variables are those which are declared within a script. 
  
They are usually declared at the beginning of the shell script.
then, when they're called, the value they've been given is what is used. the 
value can be changed at any time by re-declaring it.
This can be done anywhere within the script after the original variable is 
declared.

Environment Variables
========================

Environment Variables are those which are predeclared and can be called from any
program, script, or terminal. here's a table of a few Environment Variables

+----------------------+--------------------------------------------------------------+
|Environment Variables | Variable description of use.                                 |
+======================+==============================================================+
| $EUID                | The ID number of the current user.                           |
+----------------------+--------------------------------------------------------------+
|$PWD                  | when called, it returns the current directory                |
+----------------------+--------------------------------------------------------------+

Exported Variables
=====================
.. sidebar:: Example Exported Variable ::

        export EXPORT="This is an exported variable"
    
    Type these commands into the bash terminal: ::
        
        export NUMBER=12
        echo "echo $NUMBER" >> Test-script.sh
        bash Test-script.sh
    
    You should have gotten back 12 as the value. because NUMBER was exported, 
    the 
    script called the exported value, 12. now, type ::
    
        echo "NUMBER=4" > Test-script.sh
        echo 'echo $NUMBER' >> test-script.sh
        bash Test-script.sh
        
    You'll notice that NUMBER is now equal to 4. the reason for this is that the 
    value as defined in the script always supercedes the value as defined by the 
    export
        
Exported Variables are Variables that were defined and then exported. You can 
call any script which refrences an exported variable after exporting that 
variable, but the value of the exported variable is cleared when the terminal is
closed. Note that if a variable is declared in the script which has the same 
name but a different value then the exported variable, the value from the 
script, not the exprted value, will be called.