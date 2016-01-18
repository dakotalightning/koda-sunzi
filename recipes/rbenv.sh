# rbenv
# $1: ruby version

if [ -d /usr/local/rbenv ]; then
  echo 'rbenv already installed, skipping.'
else
  echo 'clone https://github.com/rbenv/rbenv.git'
  git clone https://github.com/rbenv/rbenv.git /usr/local/rbenv
  echo 'export RBENV_ROOT=/usr/local/rbenv' >> /etc/profile.d/rbenv.sh
  echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile.d/rbenv.sh
  echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh

  echo 'git clone git://github.com/rbenv/ruby-build.git'
  git clone git://github.com/rbenv/ruby-build.git /usr/local/rbenv/plugins/ruby-build
  echo 'export PATH="$RBENV_ROOT/plugins/ruby-build/bin:$PATH"' >> /etc/profile.d/rbenv.sh

  chmod +x /etc/profile.d/rbenv.sh
  source /etc/profile.d/rbenv.sh

  echo "Compiling Ruby. Grab some hot chocolate, this will take a while..."
  echo " - installing $1"
  rbenv install $1
  echo " - setting global $1"
  rbenv global $1
  echo " - installing bundler"
  gem install bundler --no-ri --no-rdoc
  echo " - rbenv rehash"
  rbenv rehash
fi
