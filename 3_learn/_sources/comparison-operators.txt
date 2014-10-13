#############################
Comparison Operators
#############################

symbols for strings 
letters for characters

+----------------+---------------------------------------+
|Integer Operator| description of Operator               |
+================+=======================================+
| -eq            | is equal to                           |
+----------------+---------------------------------------+
|-ne             | is not equal to                       |
+----------------+---------------------------------------+
| -gt            | greater than                          |
+----------------+---------------------------------------+
|-ge             | is greater than or equal to           |
+----------------+---------------------------------------+
|-lt             | is less than                          |
+----------------+---------------------------------------+
|-le             | is less than or equal to              |
+----------------+---------------------------------------+
|<               |is less than(within double parenthesis)|
+----------------+---------------------------------------+
|<=              |is less than or equal to( within (()) )|
+----------------+---------------------------------------+
|>               |is greater than( within (()) )         |
+----------------+---------------------------------------+
|>=              |is greater than or equal to within (())|
+----------------+---------------------------------------+

-eq
is equal to

if [ "$a" -eq "$b" ]

-ne
is not equal to

if [ "$a" -ne "$b" ]

-gt
is greater than

if [ "$a" -gt "$b" ]

-ge
is greater than or equal to

if [ "$a" -ge "$b" ]

-lt
is less than

if [ "$a" -lt "$b" ]

-le
is less than or equal to

if [ "$a" -le "$b" ]

<
is less than (within double parentheses)

(("$a" < "$b"))

<=
is less than or equal to (within double parentheses)

(("$a" <= "$b"))

>
is greater than (within double parentheses)

(("$a" > "$b"))

>=
is greater than or equal to (within double parentheses)

(("$a" >= "$b"))

string comparison

=

is equal to

if [ "$a" = "$b" ]

Caution	
Note the whitespace framing the =.

if [ "$a"="$b" ] is not equivalent to the above.

==
is equal to

if [ "$a" == "$b" ]

!=
is not equal to

if [ "$a" != "$b" ]

<
is less than, in ASCII alphabetical order

if [[ "$a" < "$b" ]]

if [ "$a" \< "$b" ]

>
is greater than, in ASCII alphabetical order

if [[ "$a" > "$b" ]]

if [ "$a" \> "$b" ]

Note that the ">" needs to be escaped within a [ ] construct.

-z
string is null, that is, has zero length

-n
string is not null.