#! /bin/bash
#
list_all_packages_repos() { 
apt-cache policy $(dpkg -l | awk 'NR >= 6 { print $2 }') |
  awk '/^[^ ]/    { split($1, a, ":"); pkg = a[1] }
    nextline == 1 { nextline = 0; printf("%-40s %-50s %s\n", pkg, $2, $3) }
    /\*\*\*/      { nextline = 1 }'
    }

list_packages_of() { #1 is the tmpfile, $2 is the ppa regexp
    grep $2 $1 | awk '{print "---> ", $1}'
}

# cache all packages files now 

tmpfile=/tmp/list_pcks.$$.txt 
list_all_packages_repos > $tmpfile

# listppa Script to get all the PPA installed on a system ready to share for reininstall
for APT in `find /etc/apt/ -name *.list`; do
    grep -o "^deb http://ppa.launchpad.net/[a-z0-9\-]\+/[a-z0-9\-]\+" $APT | while read ENTRY ; do
        USER=`echo $ENTRY | cut -d/ -f4`
        PPA=`echo $ENTRY | cut -d/ -f5`
        echo  PPA:$USER/$PPA
    list_packages_of $tmpfile "$USER/$PPA"
    done
done

rm $tmpfile 
