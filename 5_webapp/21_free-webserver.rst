.. _free-webserver:

#############################
Free Cloud Web Servers
#############################

Here are some sites that offer free trials for public web servers:

* http://aws.amazon.com/free/ - Free for 12 months at lowest tier
* https://www.digitalocean.com/ - Free for 2 months at lowest tier with promo code

Setup a server on Amazon, by browsing to::

   http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AccessingInstancesLinux.html

Open a console on your desktop, and run the commands::

   ssh -i keyfile ubuntu@servername
   sudo useradd developer -G sudo

Edit :file:`/etc/ssh/sshd_config` to allow password authentication, using the 
commands::

   (replace ``PasswordAuthentication yes`` with a sed command)
   sudo service sshd restart
   sudo service ssh restart


To install the software necessary for a basic webserver on Ubuntu::

   sudo apt-get install apache2 git