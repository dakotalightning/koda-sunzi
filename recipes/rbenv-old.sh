# rbenv
# $1: ruby version

if [ -d /home/<%= @attributes.deploy_user %>/.rbenv ]; then
  echo 'rbenv already installed, skipping.'
else
  echo 'switching to <%= @attributes.deploy_user %>'
  su <%= @attributes.deploy_user %>

  echo ' === '
  echo "$USER"
  pwd
  echo ' === '

  git clone https://github.com/rbenv/rbenv.git /home/<%= @attributes.deploy_user %>/.rbenv
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> /home/<%= @attributes.deploy_user %>/.bash_profile
  echo 'eval "$(rbenv init -)"' >> /home/<%= @attributes.deploy_user %>/.bash_profile

  git clone git://github.com/rbenv/ruby-build.git /home/<%= @attributes.deploy_user %>/.rbenv/plugins/ruby-build
  echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> /home/<%= @attributes.deploy_user %>/.bash_profile
  source /home/<%= @attributes.deploy_user %>/.bash_profile

  echo "Compiling Ruby. Grab some hot chocolate, this will take a while..."
  echo "installing $1"
  rbenv install -v $1
  echo "installing global $1"
  rbenv global $1
  echo "installing bundler"
  gem install bundler --no-ri --no-rdoc
  echo "rbenv rehash"
  rbenv rehash

  echo 'switching back'
  exit
  # chmod 600 /home/<%= @attributes.deploy_user %>/.rbenv
  # chown -R <%= @attributes.deploy_user %>:<%= @attributes.deploy_user %> /home/<%= @attributes.deploy_user %>/.rbenv
fi
