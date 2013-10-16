.. _install:

#############################
 Right Installation
#############################

It is said, *"A bad workman blames his tools."* To avoid excuses, this guide 
uses tools created by the best craftsmen of the technology community. As 
these programs are entirely free, tools are no excuse here. 

Overview
=============================

The following system components and Internet services are used to publish this 
guide:

+ **Konsole**, the Linux KDE terminal 
+ **Kate** text editor (but any editor will do) 
+ **Chrome** web browser (but Firefox, Opera or Safari may be preferred) 
+ **Python** programming language tools (python-setuptools)
+ **TeX** composition tools (texlive-full)
+ **Sphinx** Python documentation generator
+ **git** repository file system _[#]
+ **GitHub** public online repository hosting _[#]

Platform of Choice
=============================

Building a workstation platform which will create simple, elegant web documents 
without hassle is a challenge. For this guide, workstations used was an ASUS 
EeePC 1001PX runnng **Linux KUbuntu 12**. This machine can dual-boot with the 
Windows Home Starter Edition that came on it, but what is the point of using a 
non-working operating system when a working system is available for free? 

Programmers are like that. As we go farther along, you will notice links to 
various developer services, and invariably the screen shots and installation 
instructions will be written for Linux. _[#] Hopefully by the end of this guide, you 
will understand why. 

Install Dual-Booting Linux 
==============================

Here are basic directions. First, choose an operating system to download:

+ `Download Mint here <http://linuxmint.com/download.php>`_
+ `Download KUbuntu here <http://www.kubuntu.org/getkubuntu/download>`_

Burn a DVD of from operating system file, or **dd** the file to a usb key.

#. Run defrag and chkdsk on your Windows hard drive partition. 
#. Boot from CD and follow directions to partition your drive and dual-install. 

If this is too difficult, look for help at a nearby Linux user group meeting.

Installing Software
=============================

There is a whole slew of software one would want on a computer for programming, 
writing, graphic arts, and so forth. Rather than enumerate all these packages, 
a script to install software is provided as part of `this GitHub project 
repository <https://github.com/garlovel/self-publish>`_. 

Install the script as follows. First, download the script file appropriate for 
your system, saving it to file :file:`first-install.sh` in your home folder:

+ :download:`Gnome/Ubuntu 10.10 desktop </_downloads/Gnome-Ubuntu_10.10-desktop.sh>`
+ :download:`KDE/Mint 10 desktop </_downloads/KDE-Mint_10-desktop.sh>`
+ :download:`KDE/Mint 12 desktop </_downloads/KDE-Mint_12-desktop.sh>`
+ :download:`KUbuntu 12/Mint 13 desktop </_downloads/KUbuntu_12-desktop.sh>`

.. Tip:: If your browser saved this file without asking you where to put it or 
   what to name it, then edit your browser preferences to always ask when 
   saving downloads.

Now perform the following:

#. Open a console (terminal) window
#. Type the command :command:`bash first-install.sh <Enter>`
#. Enter your password when asked (this may happen multiple times)
#. When asked for a mysql pasword, type :kbd:`mysql`
#. Wait an hour or so while over 1000 software packages are installed
#. Restart your system to load the most recent Linux kernel

Installing Sphinx
=============================

We are not done yet. The desktop installation script did not include 
documentation tools, which will be installed from a separate script:

#. Download :download:`reST script </_downloads/rest-install.sh>` to filename 
   :file:`rest-install.sh`
#. Open a console (terminal) window
#. Type the command :command:`bash rest-install.sh <Enter>`
#. Enter your password when asked (this may happen multiple times)
#. Wait an hour or so while packages are installed and compiled

.. Tip:: There will be plenty of commands to type in this guide. Being a lazy 
   lot, Linux programmers have a way to avoid the typing. Open both web browser 
   and console windows in your workspace. Highlight text to be typed in the 
   browser, then move to the console and click with the mouse scroll wheel at
   the prompt.

Congratulations. Now your computer has the tools to do documentation work.

Development Environments
=============================

A nice thing about Linux is the convenience of terminal command files, where a 
short script can perform hours of tedious computer work for you. Additional 
optional scripts are listed here for installing development environments for 
writing web applications. 

+ Download :download:`Ruby on Rails with MongoDB </_downloads/ruby-install.sh>`

As described previously, open a console window and type a command such as 
:command:`bash program_name.sh <Enter>` to execute a script file.

------

.. rubric:: Footnotes

.. [#] Scott Chacon, Pro Git (August 27, 2009, ISBN-10: 1430218339), available
   at Amazon, or for free on-line at http://git-scm.com/book. 

.. [#] Scott Chacon, Pro Git book source (written in MarkDown, not reST) 
   repository on GitHub: https://github.com/progit/progit.

.. [#] http://www.howtoforge.com/useful_linux_commands presents a list of 
   useful Linux commands.

