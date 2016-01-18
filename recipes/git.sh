# git

if sunzi.installed 'git-core'; then
  echo 'git-core already installed, skipping.'
else
  apt-get -y install git-core
fi
