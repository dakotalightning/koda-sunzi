if sunzi.installed 'build-essential'; then
  echo 'build-essential already installed, skipping.'
else
  apt-get -y install build-essential
fi

if sunzi.installed 'curl'; then
  echo 'curl already installed, skipping.'
else
  apt-get -y install curl
fi

if sunzi.installed 'libssl-dev'; then
  echo 'libssl-dev already installed, skipping.'
else
  apt-get -y install libssl-dev
fi

if sunzi.installed 'libreadline-dev'; then
  echo 'libreadline-dev already installed, skipping.'
else
  apt-get -y install libreadline-dev
fi

if sunzi.installed 'libyaml-dev'; then
  echo 'libyaml-dev already installed, skipping.'
else
  apt-get -y install libyaml-dev
fi

if sunzi.installed 'libsqlite3-dev'; then
  echo 'libsqlite3-dev already installed, skipping.'
else
  apt-get -y install libsqlite3-dev
fi

if sunzi.installed 'sqlite3'; then
  echo 'sqlite3 already installed, skipping.'
else
  apt-get -y install sqlite3
fi

if sunzi.installed 'libxml2-dev'; then
  echo 'libxml2-dev already installed, skipping.'
else
  apt-get -y install libxml2-dev
fi

if sunzi.installed 'libxslt1-dev'; then
  echo 'libxslt1-dev already installed, skipping.'
else
  apt-get -y install libxslt1-dev
fi

if sunzi.installed 'libcurl4-openssl-dev'; then
  echo 'libcurl4-openssl-dev already installed, skipping.'
else
  apt-get -y install libcurl4-openssl-dev
fi

if sunzi.installed 'python-software-properties'; then
  echo 'python-software-properties already installed, skipping.'
else
  apt-get -y install python-software-properties
fi
