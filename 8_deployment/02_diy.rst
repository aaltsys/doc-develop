DIY Deployment
#######################

Create a Server
=======================

For the purpose of this lesson, we will make a server which is publicly 
accessible.
Servers are made publicly accessible through a public IP address.

(Usually you visit a website by typing its domain name, and DNS translates
this domain name to the server's public IP address, but you can also visit
a site by going straight to the IP.)

.. note: 
   For the purposes of this lesson, we have already created a demo server.
   For more information on how to create your own server, see here:
   ***Link to 07/21_free-cloud-web-server

We can visit our server at::

   http://54.68.232.191/

or ::

   http://ec2-54-68-232-191.us-west-2.compute.amazonaws.com/

And see the default ubuntu Apache installation's welcome page.
Apache is the software which directs web requests to our application.

.. image :: apache-welcome-page.png

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

After you fork the project, you will be taken to the GitHub page for 
your fork.

In GitHub, edit the :file:`index.html` file, putting your name in the ``<h1>`` 
tag.

.. image:: github-edit-index.png

Commit your changes.

Move Code to the Server
=======================

After you have finished editing and committing the :file:`index.html` 
file, click the :file:`html-demo` link at the top of your page to 
return to the main page for your fork.

In the right sidebar, copy the URL of your repository to clone from 
(HTTPS version) into your clipboard.
(For example, https://github.com/AAltSys/html-demo.git)

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

   sudo git clone https://github.com/[your-Github-id]/html-demo.git [your-directory-name]

(Paste the correct URL for your fork of the GitHub repository).
   
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
