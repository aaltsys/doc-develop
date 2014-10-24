Deploy with Capistrano
#######################

Capistrano is a tool for automating deployment.

Install Capistrano
=======================

Install RVM::
   curl -L get.rvm.io | bash -s stable

Install Ruby::
   rvm install 2.1.2
   rvm use 2.1.2 --default

Install RubyGems::
   rvm rubygems current
   rvm use --create 2.1.2@demo

Install Capistrano::
   gem install capistrano

Capify Project::
   cap install

Configure Capistrano
=======================

Edit :file:`config/deploy.rb` : 

- Change the `server` setting to the correct server address,
- Change `repo_url` to the correct URL for your fork,
- Change `deploy_to` to the folder on the server where the code will be 
  hosted (/var/www/html/[your-github-id])
- Change `user` to the user who has SSH access to the server (developer)

Example::
set :server, 'ec2-54-68-232-191.us-west-2.compute.amazonaws.com'
set :repo_url, 'https://github.com/[your-github-id]/html-demo.git'
set :deploy_to, '/var/www/html/[your-github-id]'
set :user, 'developer'

Deploy!
=======================

`cap production deploy:check`

`cap production deploy`

