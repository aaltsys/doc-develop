.. _deployment:

#############################
Deployment Overview
#############################

According to Wikipedia:

   *"Software deployment is all of the activities that make a software system 
   available for use."*

In web application development, this usually means:

*  Creating a server instance that is accessible to all users of the software.
*  Establishing and maintaining the application code on this server.

Deployment Considerations
=============================

*  Does the software need to be accessible publicly on the Internet, 
   or should it be deployed on an intranet or over a VPN?
*  Will code be deployed directly to the production server, or will there be 
   testing and staging servers as well?

.. note::
   *  When an end-user can access a web application, the hosting server is 
      commonly referred to as a "production" server. 
   *  Where a server is availabe only for program testing, but it is otherwise 
      identical to the production environment, it is called a "staging" server.
   *  Any old server which programmers deploy to for testing work is known as
      a "testing" server.


