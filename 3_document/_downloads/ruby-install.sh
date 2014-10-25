#!/bin/bash

# installing MongoDB
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
sudo bash < <(echo 'echo("deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" > /etc/apt/sources.list.d/10gen.list')
sudo apt-get update
sudo apt-get -y install mongodb-10gen
# Mongo service is run under the mongodb user account
# Mongo configuration is in /etc/mongodb.conf
# Mongo startup script is at /etc/init.d/mongodb
# Mongo stores data in /var/lib/mongodb
# Mongo logs activity in /var/log/mongodb
# Mongo client shell command: mongo

# install Ruby base 1.8.7
echo "gem: --no-ri --no-rdoc" >> ~/.gemrc
sudo apt-get -y install  nodejs ruby-full sqliteman
sudo apt-get -y install build-essential openssl libreadline6 libreadline6-dev curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison subversion pkg-config

# installing rvm in user space -- rvm installs gem -- install rubies 1.9.2, 1.9.3
\curl -kL https://get.rvm.io | bash -s stable
source ~/.rvm/scripts/rvm

# installing rubies for rvm
rvm install 1.9.2
rvm install 1.9.3
rvm --default use 1.9.3

# installing gems
gem install bundler

# create project for use with mongoDB --
# rails new projectname --skip-active-record

# create a gemset in a project with --
# cd projectname
# rvm use --create 1.9.3@projectgemset
# gem install mongoid
# ...
# bundle install
# rails g mongoid:config



