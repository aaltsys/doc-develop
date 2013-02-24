.. _use_heroku:

#############################
 Using Heroku
#############################

Heroku provides a free web application deployment services, integrated with 
the Cloud9 development environment through Git and GitHub. Following is a 
brief outline for configuring and deploying a project on Heroku.

Install Heroku Tools
=============================
+  Open a project in Cloud9
+  In the Cloud9 Project, choose :menuselection:`View --> Console` from the menu
+  At the console command line, type::
  
      c9pm install heroku

+  To make sure that your install was successful, and to get ready to use heroku,
   run the following command in your Terminal::
    
      heroku login
  
   Enter your heroku username and password when prompted.

Add Heroku Server to Project
=============================

+  Open a project in Cloud9
+  In the Cloud9 Project, choose :menuselection:`View --> Console` from the menu
+  At the console command line, type::
  
      heroku create
  
   This will create a heroku server for your app, and configure your git 
   repository with an extra remote location that you can push to to deploy your 
   app.

+  To see the new git heroku deployment branch, type::

      git remote -v
 
+  Open in a new browser tab, and bookmark, the url of your new heroku server,
   which you will see in the output of the ``heroku create`` command. The URL 
   will look similar to this:: 

      random-word-1234.herokuapp.com

+  After making changes to the project in Cloud9 and pushing to the GitHub 
   repository, deploy changes on Heroku with the additional command::

      git push heroku master

+  Now you can view your live site at your heroku server URL (which you 
   bookmarked earlier).

