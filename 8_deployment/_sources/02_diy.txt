DIY Deployment
#######################

Create a Server
=======================

Servers are made publicly accessible through a public IP address.

(Usually you visit a website by typing its domain name, and DNS translates
this domain name to the server's public IP address, but you can also visit
a site by going straight to the IP.)

For the purposes of TechCamp, we have created a demo server, but here are 
some sites that offer free trials for public web servers:

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

We can visit our server at::

   http://54.68.232.191/

or ::

   http://ec2-54-68-232-191.us-west-2.compute.amazonaws.com/

And see the default ubuntu Apache installation's welcome page.

*** Insert screenshot here ***

As this page explains, it is located in the :file:`/var/www/html` folder on the 
server. This folder is known as the "DocRoot". 

The file itself is called :file:`index.html`. When Apache gets a request for a 
folder path, it looks first for an :file:`index.html` file in that folder, and 
serves that file if it exists.

In order to see our own files, we should place them within the DocRoot. 
So, the process of deployment will require us to move our code to within the 
DocRoot on the server.

Create a Code Project
=======================

*** change to AAltsys account ***

In your browser, login to your Github account. Fork the project from 
https://github.com/JuliaLovel/html-demo.

*** Look at where Github takess you after the fork. ***

Then under "Your Repositories" on the right, click on the link to your fork
of "html-demo".

In GitHub, edit the :file:`index.html` file, putting your name in the ``<h1>`` 
tag.

*** Include screenshot ***

Move Code to the Server
=======================

Locate your code on GitHub:

In the right sidebar, copy the URL of your repository to clone from (HTTPS version).
(For example, https://github.com/JuliaLovel/html-demo.git)

SSH to the server::

   ssh developer@54.68.232.191

   password: techC@mp

.. note:
   To avoid the complication of PKI keys, password authentication is used. 

Create a unique directory in the DocRoot::

*** Define [your-directory-name] as [your-Github-id] ***

   cd /var/www/html
   sudo mkdir [your-directory-name]

Clone to your directory::

   sudo git clone https://github.com/JuliaLovel/html-demo.git [your-directory-name]

*** Again, change the repo source ***
   
View your page:

Now your page can be viewed at::

   [our-server-address]/[your-directory-name]

For example::

   http://ec2-54-68-232-191.us-west-2.compute.amazonaws.com/html-demo


What's Missing?
=======================

The DIY approach to deployment isn't bad, but for a full-fledged code application, 
it does leave some things to be desired:

- One-step automation

- Changing of configuration for different environments (locations of dependencies, database 
connection, etc.)

- Keeping different versions for easy rollback

- Restarting server processes after a deployment
