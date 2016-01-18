if sunzi.installed 'nginx'; then
  echo "nginx already installed, skipping."
else
  apt-get -y update
  apt-get -y install nginx
  #service nginx start

  # Remove any default sites.
  rm /etc/nginx/sites-enabled/default

  # Copy our configuration to `sites-enabled`.
  mv files/nginx.conf /etc/nginx/sites-available/<%= @attributes.app_name %>

  # Link to our configuration to `sites-enabled`.
  ln -s /etc/nginx/sites-available/<%= @attributes.app_name %> /etc/nginx/sites-enabled/<%= @attributes.app_name %>

  # set up web block
  mkdir -p /var/www/<%= @attributes.app_name %>

  # transfer ownership to our <%= @attributes.deploy_user%> user
  chown -R <%= @attributes.deploy_user%>:<%= @attributes.deploy_user%> /var/www/<%= @attributes.app_name %>

  # permissions
  chmod -R 755 /var/www

  # Enable our site.
  service nginx start
fi
