.. _command:

#############################
Commands and Variables
#############################

Commands
=============================


apt-get
-----------------------------

::

  apt-get install <package>
  apt-get install aptitude
  aptitude install <package>
  aptitude -f install

dpkg-reconfigure
-----------------------------

::

  dpkg-reconfigure tzdata
  dpkg-reconfigure locales

System management
=============================

Date and time
-----------------------------

::

  date
  date -s 2012-12-25 12:34:56
  date -u -s 2012-12-25 04:34:56
  hwclock --systohc --utc
  hwclock --hctosys
  ntpq -p
  ntpdate
  

----------

.. rubric:: Footnotes

.. [#] <http://www.howtoforge.com/useful_linux_commands> presents a list of 
   useful Linux commands.

.. [#] `Bash commands <http://ss64.com/bash/>`_

.. [#] `A list of Windows commands for comparison. <http://ss64.com/nt/>`_

.. _command-os:

Operating system commands
-----------------------------

+--------------+---------------------------------------------------------------+
| Command name | Command function/description                                  |
+==============+===============================================================+
| uname        | provides information about the computer/system.               |
+--------------+---------------------------------------------------------------+
| wait         | wait until process completes and returns a termination status |
+--------------+---------------------------------------------------------------+
| wget         | retrieves web pages and/or files.                             |
+--------------+---------------------------------------------------------------+

.. _command-fs:

File system commands
-----------------------------

+--------------+---------------------------------------------------------------+
| Command name | Command function/description                                  |
+==============+===============================================================+
| ls           | LiSts directory information about files                       |
+--------------+---------------------------------------------------------------+
| rm           | ReMoves/deletes file/folder directory entries                 |
+--------------+---------------------------------------------------------------+
| mv           | MoVe and/or rename file/folder directory name entries         |
+--------------+---------------------------------------------------------------+
| touch        | Update/create file directory timestamp entries                |
+--------------+---------------------------------------------------------------+
| cp           | CoPy file contents to new locations                           |
+--------------+---------------------------------------------------------------+
| cd           | Change the current working Directory                          | 
+--------------+---------------------------------------------------------------+
| mkdir        | MaKes a new DIRectory folder if it doesn't exist yet          |
+--------------+---------------------------------------------------------------+
| blkid        | Lists BLocK device IDentifiers available to the system        |
+--------------+---------------------------------------------------------------+
| mount        | Mounts a block device in the directory tree                   |
+--------------+---------------------------------------------------------------+
| umount       | Unmounts a previously mounted block device                    |
+--------------+---------------------------------------------------------------+

.. _command-text:

Text editing services
-----------------------------

+--------------+---------------------------------------------------------------+
| Command name | Command function/description                                  |
+==============+===============================================================+
| grep         | Global file [Regular Expression] text search and Print        |
+--------------+---------------------------------------------------------------+
| sed          | command-based line-oriented System EDitor                     |
+--------------+---------------------------------------------------------------+
| awk          | command-based AWKward text-oriented editor                    |
+--------------+---------------------------------------------------------------+

.. _command-sh:

Shell scripting commands
-----------------------------

+--------------+---------------------------------------------------------------+
| Command name | Command function/description                                  |
+==============+===============================================================+
| echo         |                                                               |
+--------------+---------------------------------------------------------------+
| printf       |                                                               |
+--------------+---------------------------------------------------------------+
| shopt        | set SHell OPTions                                             |
+--------------+---------------------------------------------------------------+
| read         | reads a line from standard input; gets user input             |
+--------------+---------------------------------------------------------------+

.. _variables:

Variables
=============================

.. _variables-env:

Global environment variables
-----------------------------

Environment Variables are those which are predeclared and can be called from any 
program, script, or terminal. 

+--------------+---------------------------------------------------------------+
| Variable     | Variable description of use.                                  |
+==============+===============================================================+
| DISPLAY      | The id of the working primary display                         |
+--------------+---------------------------------------------------------------+
| HOME         | Returns the present working directory                         |
+--------------+---------------------------------------------------------------+
| LANGUAGE     | Returns the present working directory                         |
+--------------+---------------------------------------------------------------+
| LINENO       | The line number of the statement being processed              |
+--------------+---------------------------------------------------------------+
| LOGNAME      | name of the user logged into the terminal                     |
+--------------+---------------------------------------------------------------+
| PATH         | The search path for system commands                           |
+--------------+---------------------------------------------------------------+
| PWD          | Returns the present working directory                         |
+--------------+---------------------------------------------------------------+
| SHELL        | path to the active shell interpreter                          |
+--------------+---------------------------------------------------------------+
| TERM         | terminfo database terminal definition                         |
+--------------+---------------------------------------------------------------+
| USER         | name of the current user (different from LOGNAME due to su)   |
+--------------+---------------------------------------------------------------+

.. tip::
   Type :command:`env` at the terminal to list global variables.

Local environment variables
-----------------------------

Below is a table of some of the variables exported by the BASH terminal.

+--------------+---------------------------------------------------------------+
| Variable     | Variable description of use.                                  |
+==============+===============================================================+
| BASH         | path to BASH command interpreter                              |
+--------------+---------------------------------------------------------------+
| COLUMNS      | Character columns defined in a terminal line                  |
+--------------+---------------------------------------------------------------+
| EUID         | The ID number of the current user                             |
+--------------+---------------------------------------------------------------+
| IFS          | string of characters to be treated as white space             |
+--------------+---------------------------------------------------------------+
| LINES        | rows (lines) of characters in a terminal line                 |
+--------------+---------------------------------------------------------------+
| MACHTYPE     | string describing system type in GNU form CPU-COMPANY-SYSTEM  |
+--------------+---------------------------------------------------------------+
| OSTYPE       | string describing the operating system                        |
+--------------+---------------------------------------------------------------+
| PS1          | The primary prompt string, defaults to "'\s-\v\$'"            |
+--------------+---------------------------------------------------------------+
| UID          | The login ID number of the current login                      |
+--------------+---------------------------------------------------------------+

.. seealso::
   `Bash Beginners Guide <http://www.tldp.org/LDP/Bash-Beginners-Guide/html/sect_03_02.html>`_

.. _variables-color:

Terminal color settings
=============================

Commands :command:`echo -e` and :command:`printf` will process embedded escape 
sequences, int the form ``\e[xx;yy;zzm``, to produce formatted or colored text.
For example, ::

   echo -e "\e[1;42;95m Some text \e[0m" ;# print Bold;FG Light Magenta;BG Green

`printf` is not documented further here, but color commands and codes are.
   
*ANSI/VT100* color codes 
-----------------------------

+------+------------+----+-----+-----+--------------+----+-----+-----+--------------+
| Code | Color      | \| | FG  | BG  | Color        | \| | FG  | BG  |   Color      |
+======+============+====+=====+=====+==============+====+=====+=====+==============+
|  0   | Normal     | \| |  30 |  40 | Black        | \| |  90 | 100 | Dark Gray    |
+------+------------+----+-----+-----+--------------+----+-----+-----+--------------+
|  1   | Bold       | \| |  31 |  41 | Red          | \| |  91 | 101 | Light Red    |
+------+------------+----+-----+-----+--------------+----+-----+-----+--------------+
|  2   | Dim        | \| |  32 |  42 | Green        | \| |  92 | 102 | Light Green  |
+------+------------+----+-----+-----+--------------+----+-----+-----+--------------+
|      |            | \| |  33 |  43 | Brown/Orange | \| |  93 | 103 | Light Yellow |
+------+------------+----+-----+-----+--------------+----+-----+-----+--------------+
|  4   | Underlined | \| |  34 |  44 | Blue         | \| |  94 | 104 | Light Blue   |
+------+------------+----+-----+-----+--------------+----+-----+-----+--------------+
|  5   | Blink      | \| |  35 |  45 | Magenta      | \| |  95 | 105 | Light Magenta|
+------+------------+----+-----+-----+--------------+----+-----+-----+--------------+
|      |            | \| |  36 |  46 | Cyan         | \| |  96 | 106 | Light Cyan   |
+------+------------+----+-----+-----+--------------+----+-----+-----+--------------+
|  7   | Inverted   | \| |  37 |  47 | Light Gray   | \| |  97 | 107 | White        |
+------+------------+----+-----+-----+--------------+----+-----+-----+--------------+
|  8   | Hidden     | \| |     |     |              | \| |     |     |              |
+------+------------+----+-----+-----+--------------+----+-----+-----+--------------+
|      |            | \| |  39 |  49 | Default      | \| |     |     |              |
+------+------------+----+-----+-----+--------------+----+-----+-----+--------------+

*Terminfo* color commands
-----------------------------

Instead of using embedded ``VT100`` codes, the :command:`tput` command can set 
terminal colors using a variety of arguments. 

*tput* command arguments
-----------------------------

+----------------------------+---------------------------------+
| Command                    | Description                     |
+============================+=================================+
| tput setab (color code)    | Set background color            |
+----------------------------+---------------------------------+
| tput setaf (color code)    | Set foreground color            |
+----------------------------+---------------------------------+
| tput bold                  | Set bold mode                   |
+----------------------------+---------------------------------+
| tput dim                   | Set half-bright mode            |
+----------------------------+---------------------------------+
| tput smul                  | Set underline mode              |
+----------------------------+---------------------------------+
| tput rmul                  | Exit underline mode             |
+----------------------------+---------------------------------+
| tput rev                   | Reverse mode                    |
+----------------------------+---------------------------------+
| tput smso                  | Set standout mode               |
+----------------------------+---------------------------------+
| tput rmso                  | Exit standout mode              |
+----------------------------+---------------------------------+
| tput sgr0                  | Reset all attributes            |
+----------------------------+---------------------------------+

setaf/setab *xterm* values
-----------------------------

+-------+-------------+----------------+
| Code  | Color       | RGB values     |
+=======+=============+================+
|  0    | black       | 0, 0, 0        |
+-------+-------------+----------------+
|  1    | red         | max,0,0        |
+-------+-------------+----------------+
|  2    | green       | 0,max,0        |
+-------+-------------+----------------+
|  3    | yellow      | max,max,0      |
+-------+-------------+----------------+
|  4    | blue        | 0,0,max        |
+-------+-------------+----------------+
|  5    | magenta     | max,0,max      |
+-------+-------------+----------------+
|  6    | cyan        | 0,max,max      |
+-------+-------------+----------------+
|  7    | white       | max,max,max    |
+-------+-------------+----------------+

The :command:`tput` command uses a ``terminfo`` terminal definition, of which 
the default :file:`xterm` definition serves the 8 colors listed above. For more 
colors, you can load :file:`xterm-256color`. Commands demonstrating this 
color set follow:

.. code-block:: bash

   export TERM='xterm-256color'
   tput colors
   for i in {0..255}
   do
     tput setab $i
     echo -n "  $i  "
   done
   tput setab 0
   echo
   export TERM='xterm'

or, this could be executed at the terminal as a single command::

   export TERM=’xterm-256color’; tput colors; for i in {0..255}; do tput setab $i; echo -n ” $i ”; done; tput setab 0; echo; export TERM=’xterm’

.. seealso::
   For more information, see the ``terminfo`` manpage.