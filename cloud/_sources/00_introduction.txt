.. _introduction:

#############################
 Cloud Development
#############################

Why Use Cloud Development
=============================

In the past, web developers would use either Mac OS-X or Linux as the base for 
a development environment. On top of that they would install maybe a hundred or 
so developer tools. Multiple projects might require different tools, or 
incompatible versions of the same tools. Now cloud services make each project a 
separate configurable service instance, removing some of the complexity and 
compatibility issues from development environments.

With cloud services, it does not matter what local computer one uses. 
What matters is that one can connect to the Internet with a web browser which 
fully supports HTML5. Previously programmers had to carry their development 
environments around, meaning they had to use laptops. Cloud services allow 
programmers to use available computers whereever they are.

Currently several cloud services are required to provide all the features a 
programming team would require for web development. This document describes one 
selection of cloud services which results in a flexible web programming 
setup. Other, possibly better, choices may exist, but that discussion is beyond 
the scope of this guide.

Services Developers Need
=============================

This project uses free services which, in combination, present the essential 
elements of a full web development environment. Typical web development needs 
and the cloud services which emulate them are listed in the following table.

+---------------------------------+------------+------------------------------+
| Development Environment Need    | Cloud Service Equivalent and URL          |
+=================================+============+==============================+
| email                           | Gmail      | https://mail.google.com/     |
+---------------------------------+------------+------------------------------+
| Linux console                   | Cloud9     | https://c9.io/               |
+---------------------------------+------------+------------------------------+
| programming language (RoR)      | Cloud9     | https://c9.io/               |
+---------------------------------+------------+------------------------------+
| text editor (Kate)              | Cloud9     | https://c9.io/               |
+---------------------------------+------------+------------------------------+
| code repository (Git)           | Cloud9     | https://c9.io/               |
+---------------------------------+------------+------------------------------+
| public repository hosting (Git) | GitHub     | https://github.com/          |
+---------------------------------+------------+------------------------------+
| web server                      | Heroku     | https://heroku.com           |                   
+---------------------------------+------------+------------------------------+
| database (postgreSQL)           | Heroku     | https://heroku.com           |                           
+---------------------------------+------------+------------------------------+

.. note:: Heroku includes client services: the `Heroku Toolbelt
   <https://devcenter.heroku.com/x?url=https%3A%2F%2Ftoolbelt.heroku.com%2F>`_, 
   Foreman, and Git.

Logins and Passwords
=============================

This project requires registration with a number of different cloud services. 
Each service has its own login requirements, as the following table shows.

+--------------------+-----------------------------------------------------------+
|Service Login Id    | Character Requirement                                     |
+====================+===========================================================+ 
| Gmail username     | Only letters (a-z), numbers, and periods                  |
+--------------------+-----------------------------------------------------------+
| Gmail password     | 8+ characters: letters, numbers, spaces, or punctuation   |
+--------------------+-----------------------------------------------------------+
| GitHub username    | alphanumeric characters or dashes not beginning with dash |
+--------------------+-----------------------------------------------------------+
| GitHub password    | 7+ characters containing a lowercase letter and a number  |
+--------------------+-----------------------------------------------------------+
| Heroku username    | your gmail address                                        |
+--------------------+-----------------------------------------------------------+
| Heroku password    | 6 or more characters: letters, numbers, or symbols        |
+--------------------+-----------------------------------------------------------+
| Cloud9 username    | Any character string, unique in Cloud9                    |
+--------------------+-----------------------------------------------------------+
| Cloud9 password    | Any character string                                      |
+--------------------+-----------------------------------------------------------+

A unique email address, username, and password which will work in all the above 
websites would be helpful. Here are the requirements for this project:

+-------------+----------------------------+-------------------------------------+ 
| Identifier  | Proposed pattern           | Example                             | 
+=============+============================+=====================================+ 
| email name  | ALT.first.last@gmail.com   | ALT.Dearheart.Davenport@gmail.com   | 
+-------------+----------------------------+-------------------------------------+ 
| username    | alt-lastname               | alt-davenport                       | 
+-------------+----------------------------+-------------------------------------+ 
| password    | 8+ char, 1 Upcase, 1 digit | D34rh34rt                           |
+-------------+----------------------------+-------------------------------------+ 

.. warning:: Use the email name format shown above. Do not use periods in your 
   username; this is prohibited. Do not use spaces in any of the entries above.