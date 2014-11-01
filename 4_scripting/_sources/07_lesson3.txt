.. _convention-lesson: 

#############################
Exercise 3: Automation Script
#############################

The usual purpose of any program is to automate an operation, so that it can be 
performed repeatedly and reliably. 

Linux gurus have done an excellent job of automating basic Linux installation, 
and the same goes for managing individual software packages. However, it still 
may take a user somewhere between hours and weeks to get a system to behave 
exactly to her liking: right applications, right options, just-so configuration. 

This script will automate the application installation process for an Ubuntu 
desktop system which is used for productivity tasks or software development 
work.

.. sidebar:: Function confirm

   .. code-block:: bash

      confirm() {
        # uses $PROMPT, returns $EXIT
        #
        tput rev
        echo -n $PROMPT
        read -n 1 -p "? [Y/n]" RESPONSE
        tput sgr0
        echo
        case $RESPONSE in
          Y|y)
            EXIT=0 ;;
          N|n)
            EXIT=1 ;;
          *)
            EXIT=2 ;;
        esac
      }

Preliminaries
=============================

To begin, create a fresh copy of :download:`example.sh <_downloads/example.sh>` 
and save it under the name :file:`installer.sh`.

Add function confirm
-----------------------------

The script will need a user confirmation to prevent runaway execution. This is 
supplied by a function in the library, so let's add that to FUNCTIONS now. 

.. admonition:: Instruction

   Add the sidebar code into the "FUNCTIONS" section of :file:`installer.sh`.
   The comments say that variable ``PROMPT`` is required, so declare this 
   variable with the statement ``PROMPT=''`` in the variable declaration 
   section as well.

Initialization Section
-----------------------------

.. sidebar:: Confirm script execution

   .. code-block:: bash

      # check OS type 
      # Uses PROMPT, returns OS, VERSION, EXIT
      #
      read OS < /etc/issue
      case $OS in
        Ubuntu*)
          ARRAY=($OS)
          VERSION=${ARRAY[1]} ;;
        Debian*) ;;
        *)
          echo "Not Debian or Ubuntu, exiting ..."
          EXIT=1 ;;
      esac
      # 
      # Check privileges
      if [ $EUID -ne 0 ]
      then
        echo -e "\e[1;31m try again using sudo \e[0m"
        EXIT=1
      else
        # test user confirmation
        PROMPT='Install packages for Kubuntu'
        confirm
      fi
      # 
      if [ $EXIT -gt 0 ]
      then 
        echo -e "\e[1;31m Package installation was canceled. \e[0m"
        exit $EXIT
      fi

Before a script does run, it is necessary to check that the script should run.
Following is a set of conditions that must be satisfied before executing 
:file:`installer.sh`:

*  The system must be Debian or Ubuntu,
*  The user must have ``root`` privileges,
*  The user must confirm the action.

Again, these checks are not specific to the purpose of this script, so a general 
routine will be used.

.. admonition:: Instruction

   Add the sidebar code to the CONFIRMATION section of :file:`installer.sh`. 

For the variables which will be used or returned, add the following variable 
declarations as well::

   PROMPT=''
   EXIT=0
   OS=''
   VERSION=''

Finally, add a couple statements to the program exit section also, so that a 
normal exit can be identified during testing::

   echo $EXIT
   exit $EXIT

Serving the Program Purpose
=============================

This script will use Debian's :program:`apt` software repository system to 
install programs.

Speeding up Installs
-----------------------------

:program:`apt` is slow to retrieve packages, due to latency of software 
repository mirrors. Program :program:`apt-fast` improves download speeds by 
accessing multiple nearby mirrors simultaneously, like torrents do. We want a 
routine to install :program:`apt-fast`, which is cribbed from 
`this website <http://xmodulo.com/speed-slow-apt-get-install-debian-ubuntu.html>`_.
The instructions for Ubuntu 14.04 and previous supported versions are::

   sudo add-apt-repository ppa:apt-fast/stable
   sudo apt-get update
   sudo apt-get install apt-fast

.. note::
   The instructions for installing apt-fast on Debian are provided here, but 
   not implemented in this example script.

   .. code-block:: bash

      sudo apt-get install aria2
      wget https://github.com/ilikenwf/apt-fast/archive/master.zip
      unzip master.zip
      cd apt-fast-master
      sudo cp apt-fast /usr/bin
      sudo cp apt-fast.conf /etc
      sudo cp ./man/apt-fast.8 /usr/share/man/man8
      sudo gzip /usr/share/man/man8/apt-fast.8
      sudo cp ./man/apt-fast.conf.5 /usr/share/man/man5
      sudo gzip /usr/share/man/man5/apt-fast.conf.5

.. sidebar:: Installing apt-fast

   .. code-block:: bash

      apt-fast-install() {
        # uses VERSION, EXIT, PROMPT
        # returns PKGS
        # calls apt-repos, apt-pkgs, confirm
        #
        # check if apt-fast is installed
        dpkg -s 'apt-fast' > /dev/null 2>&1
        if [ $? -eq 0 ] 
        then
          PROMPT='Skip apt-fast mirror configuration'
          confirm
          if [ $EXIT -ne 0 ] 
          then 
            apt-fast-config
            EXIT=0
          fi
        else
          # determine REPOS for apt-fast
          case $VERSION in
            10*|11*|12*|13*)|14.04*)
              REPOS='ppa:apt-fast/stable' ;;
            14.04*)
              REPOS='ppa:saiarcot895/myppa' ;;
            *) 
              echo -e "\e[1;31m apt-fast is not released for $VERSION \e[0m" ;;
          esac
          #
          if [ $REPOS != '' ]
          then
            PROMPT='Install program apt-fast'
            confirm
            if [ $EXIT -gt 0 ] 
            then EXIT=0 ;       # not confirmed, reset EXIT
            else
              # install apt-fast
              PKGS='apt-fast'
              apt-repos
              apt-pkgs
              apt-fast-config
            fi
          fi
        fi
      }
 
The first question for this routine needs to be, has :program:`apt-fast` been 
installed already? This question must be addressed for the script to be 
*idempotent*.

Next up is to determine if :program:`apt-fast` can be installed: is there a 
repository for it? Using the ``$VERSION`` variable from the starting 
confirmation, a case statement calculates the repository string in ``$REPOS``.

Finally, the user gets choose whether or not to install :program:`apt-fast`. 
This section reuses the ``confirm`` function we started with.

.. admonition:: Instruction

   The sidebar code was written specifically to install :program:`apt-fast`. 
   Add this function to the DECLARE FUNCTIONS section of :file:`installer.sh`,
   placing it after function ``confirm()``. Then add the call to function
   ``apt-fast-install`` in the VALIDITY TESTS section of the MAIN program.

In addition to the function code, add statement ``PKGS=''`` to the variable
declarations, and add placeholder functions ``apt-repos() { : }`` and 
``apt-pkgs() { : }`` to the DECLARE FUNCTIONS section above function 
``apt-fast-install()``. 

.. tip::
   Empty functions will generate errors on execution. The ``:`` operator, a 
   bash built-in equivalent of NOP or no operation, is used to prevent these 
   errors in the placeholder functions.

.. warning::
   A function should always be declared preceding any calls to that function 
   name.

Configuring apt-fast
-----------------------------

Configuring :program:`apt-fast` requires selecting up to five mirrors which are 
geographically close to the user. There are about 
`70 U.S. mirrors for Ubuntu <https://launchpad.net/ubuntu/+archivemirrors>`_, 
of which maybe 20% are actually up-to-date, and some of these mirrors have 
limited bandwidth. 

Writing a dynamic configuration routine for :program:`apt-fast` would require 
screen-scraping the Ubuntu mirrors webpages and a fair bit more, and the 
resulting code would be unreliable at best. 

As a temporary work-around, a mirrors list has been assembled by hand and 
(ugh!) assigned to a variable ``MIRRORS``. (This data should be moved to a 
configuration file ASAP; configuration data does not belong in program code.)

.. code-block:: bash

   apt-fast-config() {
     # updates configuration file /etc/apt-fast.conf 
     # uses MIRRORS, sets /etc/apt-fast.conf
     #
     touch /etc/apt-fast.conf
     sed -r "/MIRRORS=.*$/d" -i /etc/apt-fast.conf
     sed -r "$ a\$MIRRORS" -i /etc/apt-fast.conf
   }

.. admonition:: Instruction

   Copy the ``apt-fast-config()`` function above and place it above function 
   ``apt-fast-install()`` in the FUNCTION DECLARATIONS. Then add the $MIRRORS
   declaration to the VARIABLE DECLARATIONS::

      MIRRORS='MIRRORS=("http://us.archive.ubuntu.com/ubuntu'
      MIRRORS+=',http://mirror.pnl.gov/ubuntu/'
      MIRRORS+=',http://mirrors.centarra.com/ubuntu/'
      MIRRORS+=',http://mirror.tocici.com/ubuntu/'
      MIRRORS+=',http://mirrors.us.kernel.org/ubuntu/")'

Installation routines
=============================

Finally, the placeholder routines for installing repositories and packages can 
be replaced with actual code.

.. tip::
   Debian's :program:`apt` software repository system can install multiple 
   packages at a time, but if any of a list of packages has no installation 
   candidate, the whole list will be skipped. These routines process package 
   lists one package at a time to avoid skipping.

apt-repos
-----------------------------

.. code-block:: bash

   apt-repos() {
     # uses REPOS, APTMGR, returns APT
     #
     apt-manager
     # Install repositories listed in variable REPOS
     APT=0
     for NAME in $REPOS
     do
       APT+=1
       apt-add-repository $NAME
     done
     # verify installation and update packages indexes
     if [ $APT -ne 0 ] 
     then
       echo -e "\e[1;32m Updating repository indexes \e[0m"
       apt-get -y -f install && apt-get -y update 
     fi
   }

.. admonition:: Instruction

   Use the ``apt-repos()`` function above to replace the temporary stub of the 
   same name in the FUNCTION DECLARATIONS. 

apt-pkgs
-----------------------------

.. code-block:: bash

   apt-pkgs() {
     # uses PKGS, APTMGR; returns APT
     # calls apt-manager
     #
     apt-manager
     # Install packages listed in variable PKGS
     APT=0
     for NAME in $PKGS
     do
       dpkg -s $NAME > /dev/null 2>&1
       if [ $? -ne 0 ]
       then
         APT+=1
         echo -e "\e[1;32m Missing $NAME will be installed \e[0m"
         $APTMGR -y install $NAME
       fi
     done
     # verify installation and update packages indexes
     if [ $APT -ne 0 ]
     then
       echo -e '\e[1;32m Wait as system packages are updated \e[0m'
       $APTMGR -y -f install && apt-get -y update 
     fi
   }

.. admonition:: Instruction

   Use the ``apt-pkgs()`` function above to replace the temporary stub of the 
   same name in the FUNCTION DECLARATIONS. 

.. tip::
   Debian's :program:`apt` software repository system can install multiple 
   packages at a time, but if any of a list of packages has no installation 
   candidate, the whole list will be skipped. These routines process package 
   lists one package at a time to avoid skipping.

The ``apt-pkgs()`` function calls an additional function, ``apt-manager()``, to 
determine what ``apt`` installer to use -- :program:`apt-fast` or 
:program:`apt-get` -- during install operations. Lets add this final function.

apt-manager
-----------------------------

.. code-block:: bash

   apt-manager() {
     # returns APTMGR
     #
     dpkg -s 'apt-fast' > /dev/null 2>&1
     if [ $? -ne 0 ]
     then
       APTMGR='apt-get'
     else
       APTMGR='apt-fast'
     fi
   }

.. admonition:: Instruction

   Copy the ``apt-manager()`` function and insert the code above ``apt-pkgs()`` 
   in the FUNCTION DECLARATIONS. 

Reading through the code so far, a pattern will emerge. For each routine:

*  A function performs one specific task.
*  Typically, but not always, a function returns a single variable.
*  Each function uses a minimum of input variables.
*  Each function calls a limited number of other functions, if any.
*  Functions check before performing redundant operations.
*  Every Function is idempotent.
*  Function code is generalized for potential reuse.
*  Routines get user confirmation before changing settings.

In fact, only one main routine has been written so far, and all the other code 
is generalized supporting functions for that routine.

The MAIN Program 
=============================

Now it is time to write the main code for installing software. First is to add 
repositories for packages. Add the following code to the main program body:

.. code-block:: bash

   # universe/multiverse repositories
   apt-add-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) main universe restricted multiverse"

   # add repositories for: Cinelerra, Ubuntu tweaks, Rails
   # REPOS='ppa:cinelerra-ppa/ppa ppa:tualatrix/ppa ppa:ubuntu-on-rails/ppa'
   # apt-repos

   # upgrade curl, firefox, ttf-lyx, ubufox
   PKGS='curl firefox ttf-lyx ubufox'
   apt-pkgs

Install Google Chrome stable
-----------------------------

Next will be the code to install :program:`Chrome`. There is a repository for 
:program:`Chrome`, but the Google Chrome website does it another way. Add this 
code to the main program body:

.. code-block:: bash

   # install Google Chrome stable
   CHROMEVER='google-chrome-stable_current_'
   if [[ `uname -i` =~ i*86 ]] 
   then CHROMEVER+='i386.deb'
   else CHROMEVER+='amd64.deb'
   fi 
   wget -O /tmp/chrome.deb https://dl-ssl.google.com/linux/direct/$CHROMEVER
   dpkg -i /tmp/chrome.deb
   rm /tmp/chrome.deb

Install productivity apps
-----------------------------

Now there are several sections of programs, all of which are maintained in 
package repositories. These programs will be installed in groups; add the code 
for each group to the main section of the program:

.. code-block:: bash

   # install desktop productivity apps
   PKGS='blender dia filezilla freemind gimp gnucash inkscape mypaint'
   PKGS+=' openshot scribus shotwell xaralx xsane'
   # PKGS+=' cinelerra'
   apt-pkgs

Install desktop utilities
-----------------------------

.. code-block:: bash
   
   # install desktop utility apps
   PKGS='aptitude byobu cifs-utils diffuse dosbox dosemu'
   PKGS+=' hplip-gui keepassx krdc kubuntu-restricted-extras lftp mc'
   PKGS+=' nfs-common openvpn plasma-widget-lancelot putty recordmydesktop' 
   PKGS+=' screen shutter unison vlc whois wine wireshark xclip'
   # PKGS+=' playonlinux ubuntu-tweak'
   apt-pkgs

Install Sun (Oracle) java
-----------------------------

.. code-block:: bash
   
   # install Sun (Oracle) java
   PKGS='sun-java6-bin sun-java6-fonts sun-java6-javadb sun-java6-jdk'
   PKGS+=' sun-java6-jre sun-java6-plugin'
   apt-pkgs

Install playonlinux console
-----------------------------

To add entertainment value, uncomment the following code and add it to the main 
section as well:

.. code-block:: bash
   
   # install playonlinux windows game console
   # wget -q "http://deb.playonlinux.com/public.gpg" -O- | apt-key add -
   # wget http://deb.playonlinux.com/playonlinux_trusty.list -O /etc/apt/sources.list.d/playonlinux.list
   # $APTMGR update
   # $APTMGR install playonlinux

Clean Up and Exit
=============================

Finally, this program is finished except for the exit. Normally a program would 
have a single exit point which would report a status. This script would be just 
like that too, except that it gives the user the selection to reboot when 
finished. The ``&`` after :command:`reboot` instructs shell to execute the 
reboot in a subshell, so that our script can exit normally.

Put the following statements in the EXIT CODE section at the bottom of the 
program:

.. code-block:: bash
   
   apt-get clean && apt-get update && apt-get upgrade
   
   if [ $EXIT -eq 0 ] 
   then
     PROMPT='Installation successful. Reboot now'
     if [ $EXIT -gt 0 ] 
     then reboot &
     fi
   else echo "EXIT value is $EXIT"
   fi
   
   exit $EXIT

Logic Test Results
=============================
   
Again, sample program results on logic tests can be viewed on a separate page: 
:ref:`installer-answers`.

**And now, we are finished.**