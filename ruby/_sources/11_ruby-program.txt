.. _ruby_programming:

#############################
 Ruby Programming Concepts
############################# 

Executing Ruby
=============================

There are multiple ruby execution modes: script or program files (program.rb), 
interactive ruby commands (irb), and embedded ruby (script.erb).

Ruby Files
-----------------------------

.. sidebar:: Example Ruby files

   Create an edit a file, :file:`hello.rb`.
   Enter the text and save the file::
     
     #!/usr/bin/ruby
     puts 'Hello world'

   Then click the :guilabel:`Run` button in the menu bar.

Ruby program files use the extension :file:`.rb`. Any ruby file may be executed
with the command::

  ruby filename

To avoid calling the ruby interpreter explicitly, a "shebang" statement may be
added in the first line of the file::

  #! /usr/bin/ruby

IRB
-----------------------------

.. sidebar:: Example interactive Ruby

  Open a Cloud9 terminal window, and type::

    irb

IRB, or interactive Ruby, is an interactive environment for Ruby scripting. 
IRB is a Ruby command line, run inside the system console. Exit IRB back to the
shell command prompt by typing :command:`exit`.

|

----------

Variables 
=============================

| A variable is a named space in memory that stores some data. 
| A variable is identified by its name.
| A variable exists within a scope, and is deleted by a garbage collector when 
  it is no longer needed.

---------

.. sidebar:: Assigning variables

  Look for a variable named ``x``::

    x

  Assign a value to ``x``::

    x = 1

Assignment
-----------------------------

To create a variable in ruby, you assign it an initial value.
The ``=`` in ruby is known as the assignment operator. It is used like:
``variable_name = variable_value``

|
|
|
|
|

---------

Data Types
-----------------------------

.. sidebar:: Using data types

  Assign a boolean::

    x = true

  Assign a string::

    x = "This is a string"

  Assign an integer::

    x = 1

  Assign a float::
    
    x = 0.1

  Assign an array::

    x = ["Item 1", "Item 2", "Item 3"]

  Assign a hash::

    x = {:name => "variable x", :value => 1}

  Type a variable by assignment::

    x.is_a? Hash
    x = 1
    x.is_a? Hash

Ruby uses the following basic types for variables:

+ Boolean
+ String
+ Integer
+ Decimal / Float
+ Array
+ Hash

The type of a variable is determined by syntax of the assigned data value. 
Ruby is a dynamically typed language. That means that changing the value of a 
variable implicitly changes its type, since a variable inherits its data type 
from its value.

|

+------------+---------------------------------------+
| Datatype   | variable syntax                       |
+============+=======================================+
| Boolean    | unquoted ``true`` or ``false``        |
+------------+---------------------------------------+
| String     | "Text enclosed in quotes"             |
+------------+---------------------------------------+
| Integer    | A number without a decimal point      |
+------------+---------------------------------------+
| Float      | A number with a decimal point         |
+------------+---------------------------------------+
| Array      | | A comma-separated list of values    |
|            | | enclosed by square brackets         |
+------------+---------------------------------------+
| Hash       | | A comma-separated key-value pair    |
|            | | enclosed by curly braces            | 
+------------+---------------------------------------+  

|
|

---------

Arithmetic
-----------------------------

.. sidebar:: Arithmetic operations
 
  Enter the statements::

    x = 1
    x - 0 * 2
  
  Result: ``1``

  Enter the statement::

    (x - 0) * 2

  Result: ``2``

Ruby does all of the normal arithmetic operations on integer and 
decimal/float variables.

+------------------+----------+-----------------+
| Operation        | Operand  | Sample Syntax   |
+==================+==========+=================+
| Addition         | ``+``    | ``x + 2``       |
+------------------+----------+-----------------+
| Subtraction      | ``-``    | ``x - 2``       |
+------------------+----------+-----------------+
| Multiplication   | ``*``    | ``x * 2``       |
+------------------+----------+-----------------+
| Division         | ``/``    | ``x / 2``       |
+------------------+----------+-----------------+
| Exponentiation   | ``**``   | ``x ** 2``      |
+------------------+----------+-----------------+
| Modulus          | ``%``    | ``x % 2``       |
+------------------+----------+-----------------+

The order of operations is the same as in regular math. Parentheses, which 
group operations, have the highest order of precedence.

Assignment Operators
-----------------------------

.. sidebar:: Arithmetic assignment

   Enter the statements::

     x = 2
     x -= 1
  
   Result: ``1``

   Enter the statement::

     x *= 2

   Result: ``2``

Assignment may be combined with a single arithmetic operator which performs 
the given arithmetic operation on the variable, and assigns the result of that 
operation to the new value of the variable, replacing the old value.

For example:

+-----------+------------+---------------+-----------+
| Operand   | Initial x  | Sample Use    | Result x  |
+===========+============+===============+===========+
| ``+=``    | 1          | ``x += 2``    | 3         |
+-----------+------------+---------------+-----------+
| ``-=``    | 3          | ``x -= 2``    | 1         |
+-----------+------------+---------------+-----------+
| ``*=``    | 1          | ``x *= 2``    | 2         |
+-----------+------------+---------------+-----------+
| ``/=``    | 2          | ``x /= 2``    | 1         |
+-----------+------------+---------------+-----------+
| ``%=``    | 1          | ``x %= 1``    | 0         |
+-----------+------------+---------------+-----------+

----------

String Concatenation
-----------------------------

.. sidebar:: String concatenation

   In IRB, create a string variable called "formatted_x" that uses the value of 
   the integer variable "x" in it::

     formatted_x = "$" + x + ".00"

Note that the string literals to be concatenated are surrounded by quotes, and 
anything not surrounded by quotes represents a variable or method's *value*. 

Changing the value of x *will not* update the value of formatted_x, which is a 
separate variable. A :command:`method` is required to auto-update formatted_x 
every time that x is changed. Read on to find out how later.

.. note:: The ``+`` operator is overloaded in Ruby to provide two operations: 
   addition of numbers, and concatenation with strings.

----------

Comparison Operators
-----------------------------

.. sidebar:: Sample comparisons

  Create some variables describing a fast food order::

    sandwich = "cheeseburger"
    condiments = ["pickles", "mustard", "ketchup"]
    combo = true
    size = "medium"
    drink_upsize = true

  Now place an order::

    order = {
      :sandwich => sandwich,
      :condiments => condiments,
      :combo => combo,
      :size => size,
      :drink_upsize => drink_upsize
    }

  Does this order include a combo and an upsized drink?::

    combo && drink_upsize

  Now change the variable values, then compare with **and**::

    drink_upsize = false
    combo && drink_upsize

  Now compare using **or**::

    combo || drink_upsize

  Results: ``true``, ``false``, ``true``

Comparison operators compare two values, and return a boolean result of ``true`` 
or ``false``. Ruby syntax for standard comparisons are listed following:

+-------------------+----------+----------------+
| Operation         | Operand  | Sample Syntax  |
+===================+==========+================+
| Equal To          | ``==``   | ``x == y``     |
+-------------------+----------+----------------+
| Not equal To      | ``!=``   | ``x != y``     |
+-------------------+----------+----------------+
| Greater than      | ``>``    | ``x > y``      |
+-------------------+----------+----------------+
| Less than         | ``<``    | ``x < y``      |
+-------------------+----------+----------------+
| Equal or Greater  | ``>=``   | ``x >= y``     |
+-------------------+----------+----------------+
| Equal or Lesser   | ``<=``   | ``x <= y``     |
+-------------------+----------+----------------+
| Boolean ``and``   | ``&&``   | ``x && y``     |
+-------------------+----------+----------------+
| Boolean ``or``    | ``||``   | ``x || y``     |
+-------------------+----------+----------------+

|
|
|
|
|
|
|
|
|
|
|
|
|
|
|
|

Is equal to
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. sidebar :: Comparisons with ``Is equal to``

  Compare a boolean variable's value to a boolean::

    combo == true

  Compare two boolean variables::
  
    combo == drink_upsize 
  
  Comparing a boolean to a string::

    combo == "true"

  Compare two strings::

    sandwich == "burger"


The ``Is Equal To`` comparison can be used on two values of *any type* to 
determine if they equal each other.

.. warning :: Do not confuse ``==`` with ``=``!

|
|
|
|
|
|
|
|
|
|
|
|
|

.. note:: Ruby has additional comparison operators for particular programming 
   uses:

   +--------------------+------------+-------------------------+
   | Operation          | Operand    | Result                  |
   +====================+============+=========================+
   | Math comparison    | ``<=>``    | | ``1`` if greater than |
   |                    |            | | ``0`` if equal to     |
   |                    |            | | ``-1`` if less than   |
   +--------------------+------------+-------------------------+
   | threequal method   | ``===``    | when clause equality    |
   +--------------------+------------+-------------------------+
   | ``.eql?`` method   | ``.eql?``  | equal type and values   |
   +--------------------+------------+-------------------------+
   | ``equal?`` method  | ``equal?`` | equal object ids        |
   +--------------------+------------+-------------------------+

----------

Conditionals
-----------------------------

.. sidebar :: If...Else

  For example: ::

    if order[:sandwich] == "cheeseburger"
      puts "You ordered a cheeseburger"
    end

    if order[:sandwich] == "cheeseburger"
      puts "You ordered a cheeseburger!"
    else 
      puts "You didn't order a cheeseburger."
    end

If...Else
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Conditional statements are the simplest form of branching in coding. The first 
condtional is the ``if...else``. It's used to say: if this codition is true, 
do one thing, if it's not, do another thing. 

First, the interpreter checks to see if the conditional statement after the 
``if`` is true. If it is, the code in the ``if`` section is run, and if it is 
false, the interpreter moves on to the code in the ``else`` section.
   
The structure of the ``if...else`` statement is::

  if conditional statement
    code to run if conditional returns true
  else
    code to run if conditional returns false
  end

Notice you always need an ``end`` after any conditional statement, to let the
interpreter know where the code that belongs to your branch ends. If you don't
have it, you will get an error.

.. sidebar :: Elsif

  Check if either a burger or cheeseburger was ordered::

    if order[:sandwich] == "cheeseburger"
      puts "You ordered a cheeseburger!"
    elsif order[:sandwich] == "burger"
      puts "You ordered a burger!"
    end   

  Add a branch for the case that something else was ordered::

    if order[:sandwich] == "cheeseburger"
      puts "You ordered a cheeseburger!"
    elsif order[:sandwich] == "burger"
      puts "You ordered a burger!"
    else 
      puts "You didn't order a burger at all."
    end   

If...Elsif
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Using ``elsif`` (short for "else if", and used only in Ruby) allows you to add 
more than one conditional to the same statement as your if or ``if...else``. 

The conditions are checked in order, and when a condition is met, the code in
that branch is executed, then the block is exited, so no other conditions are 
checked.

|
|
|
|
|
|
|
|
|

.. sidebar :: Unless

  Use ``unless`` with a comparison statement::

    unless order[:combo] == false
      puts "You get fries and a drink with that sammy!"
    end

  Use ``unless`` with a boolean variable::

    unless order[:drink_upsize]
      puts "You get a" + order[:size] + " fries and drink with that sammy!"
    end

Unless
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

``Unless`` is just the opposite of ``if``. Use it when you want some code to run
unless this one particular condition is met.


|
|
|
|
|
|
|
|
|
|

---------

Methods
-----------------------------

Methods are used to run multiple lines of code at one time.

Variables can be passed in to methods using parentheses. In the method 
definition, you give the variable a name to be used within the method. Then, 
when the method is called, any value passed in that place will be
used as the value of the variable. If a method is defined to take variables in 
Ruby, then you must pass values in to that method for those variables, or you 
will get an argument error.

Methods can be called on objects in Ruby using object notation: 
``object.method``. 

---------

Nil and Blank
-----------------------------

Nil represents something that has not yet been given a value. When used in a 
conditional, ``nil`` is interpreted like ``false``. However nil is not equal to 
``false`` or ``0``. To check whether a variable has a value or not, use
``object.nil?``.

Blank represents nil or an empty string. The ``object.blank?`` method can be 
used to check whether a variable is either an empty string or nil.

---------

Blocks & Loops
-----------------------------

Loops allow you to repeat a line or block of code.

.. sidebar :: Do loop

  Do something 3 times::
  
    3.times do 
      x += 1
      puts "x is " + x
    end

  Do something for each object in an array::

    condiments.each do |condiment|
      puts condiment
    end

Do Loop
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The ``do`` loop is used to repeat code a specified number of times.

Do can be used in combinatio with the ``each`` method to iterate over an array 
or collection of objects.

While Loop
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The while loop repeats code as long as a given condition is true.

|
|
|
|
|
|
|
|
|
|

---------

Get User input
------------------------------------

Use ``gets`` to take user input from the console in Ruby.

---------

Coding Best-Practices: KISS, DRY
------------------------------------

These acronyms are handy for remembering two important coding concepts:

Keep It Simple Stupid

and

Don't Repeat Yourself

---------

Put it all together
------------------------------------

See if you can write a ruby script in a .rb file that will take an order when it
is run.

----------------

.. rubric:: Footnotes

#. `Wiki books guide to Ruby Programming <http://en.wikibooks.org/wiki/Ruby_Programming>`_