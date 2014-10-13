.. _shell:

#############################
Shell Script Programming
#############################

The Linux Shell
=============================

Every operating system has an interpreter loop which does one of two things: it 
receives user input events and processes them, and/or it interprets and executes 
text commands. A Linux/Unix **shell** is a system program which interprets and 
executes commands which may be input at a console, read from a file, or passed 
through a data stream.

Command shells are not necessarily interpreted programming languages: 
Microsoft's COMMAND.COM for MS_DOS certainly is not. But it so happens that Unix 
terminal shells are examples of structured REPL programming languages (see 
:ref:`history`). So learning shell scripting is a good way to learn programming 
in general, provided you do not whack your operating system in the process. 

Why You Should Care
=============================

Unix-like operating systems have experienced a public domain rebirth in Linux,
where Linux servers now account for a large majority of all active web servers. 
Also, Apple's OS-X operating system for the Macintosh is a Unix, and these 
computers are wildly popular in the programming community. As a result, any 
programmer doing collaborative web development is almost certain to be working 
with shell programming either on the desktop, or on servers, or both.

.. _history:

The History of REPL
=============================

Once there was a company, AT&T, whose Bell Labs division conducted extensive 
research into computer operating systems and programming languages. This 
produced stuff like UNIX, ALGOL, C, PLAN9, and various other computer softwares 
which are mostly no longer around in their original form, if at all. The AT&T 
phone service monopoly was divested in 1982, and intellectual property from Bell 
Labs became redundant over time. 

In the stew of Bell Labs projects was a command shell for UNIX, an interpreter 
to execute commands which might be obtained through user input, or read from a 
file or a data stream. 

The idea of an command interpreter may have come from the LISP programming 
language. While ALGOL and C are compiled languages, LISP can be interpreted. A 
LISP interpreter processes each statement in four steps: Read, Eval, Print, and 
Loop; whence comes the acronym 
`REPL <http://en.wikipedia.org/wiki/Read%E2%80%93eval%E2%80%93print_loop>`_. 
But, LISP was not a Bell Labs project, so shell programming syntax was 
ripped from ALGOL, C, and UNIX commands instead. History is replete with 
mistakes, of which this was one. This one example is enough to justify the open 
source programming paradigm.

Despite the awful syntax, Linux computer operations are easily automated through 
shell scripts, as this guide will demonstrate for your Linux computer. 
(What -- You don't have a Linux system? 
`What are you waiting for? <http://www.kubuntu.org/getkubuntu>`_)

-----------

References:

http://steve-parker.org/sh/sh.shtml

https://developer.apple.com/library/mac/documentation/opensource/Conceptual/ShellScripting/shell_scripts/shell_scripts.html

http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html
