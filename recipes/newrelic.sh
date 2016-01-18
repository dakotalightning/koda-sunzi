# Setup Server Monitoring on New Relic

if sunzi.installed 'newrelic-sysmond'; then
  echo 'newrelic-sysmond already installed'
else
  # Add New Relic repository
  echo deb http://apt.newrelic.com/debian/ newrelic non-free >> /etc/apt/sources.list.d/newrelic.list
  wget -O- https://download.newrelic.com/548C16BF.gpg | apt-key add -

  # Update the catalog, then install the package
  apt-get -y update
  apt-get -y install newrelic-sysmond

  # Setup your license key
  nrsysmond-config --set license_key=<%= @attributes.new_relic_license_key %>
  /etc/init.d/newrelic-sysmond start
fi
