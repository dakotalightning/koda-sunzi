#!/bin/bash
set -e

# Load base utility functions like sunzi.mute() and sunzi.install()
source recipes/sunzi.sh

# This line is necessary for automated provisioning for Debian/Ubuntu.
# Remove if you're not on Debian/Ubuntu.
export DEBIAN_FRONTEND=noninteractive

# Add Dotdeb repository. Recommended if you're using Debian. See http://www.dotdeb.org/about/
# source recipes/dotdeb.sh
# source recipes/backports.sh

# Update apt catalog and upgrade installed packages
sunzi.mute "apt update"
sunzi.mute "apt-get -y upgrade"

# Set RAILS_ENV
environment=<%= @attributes.environment %>

sunzi.say 'checking RAILS_ENV'
if ! grep -Fq "RAILS_ENV" ~/.bash_profile; then
  echo 'Setting up RAILS_ENV...'
  echo "export RAILS_ENV=$environment" >> ~/.bash_profile
  source ~/.bash_profile
  echo 'gem: --no-ri --no-rdoc' > ~/.gemrc
else
  sunzi.say 'RAILS_ENV ok'
fi

sunzi.say 'build-essential'
source recipes/build-essential.sh
sunzi.say 'git'
source recipes/git.sh
sunzi.say 'nodejs'
source recipes/nodejs.sh
sunzi.say 'mysql'
source recipes/mysql.sh
sunzi.say 'adduser'
source recipes/adduser.sh
sunzi.say 'rbenv ruby version <%= @attributes.ruby_version %>'
source recipes/rbenv.sh <%= @attributes.ruby_version %>
sunzi.say 'nginx'
source recipes/nginx.sh
sunzi.say 'ufw'
source recipes/ufw.sh
sunzi.say 'sudonopassword'
source recipes/sudonopassword.sh
sunzi.say 'set_env_vars'
source recipes/set_env_vars.sh
sunzi.say 'newrelic'
source recipes/newrelic.sh
sunzi.say 'redis'
source recipes/redis.sh
