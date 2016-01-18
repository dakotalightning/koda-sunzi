# mysql
# TODO this needs work

if sunzi.installed 'mysql-server'; then
  echo 'mysql already installed, skipping.'
else
  apt-get -y update
  sunzi.install "mysql-server"
  sunzi.install "mysql-client"
  sunzi.install "libmysqlclient-dev"
  mysqladmin -uroot create <%= @attributes.mysql_database %>
  mysql -uroot -e "grant all on <%= @attributes.mysql_database %>.* to <%= @attributes.mysql_user %> identified by '<%= @attributes.mysql_password %>';"
  mysql -uroot -e "set password for root@localhost=password('<%= @attributes.mysql_password %>');"
  service mysql reload
fi
