if [ -d /etc/redis ]; then
  echo "nginx already installed, skipping."
else
  apt-get -y update
  apt-get -y install tcl8.5

  echo "download redis"
  wget --quiet http://download.redis.io/releases/redis-stable.tar.gz

  mkdir -p /tmp/redis
  mv redis-stable.tar.gz /tmp/redis-stable.tar.gz
  tar -xzf /tmp/redis-stable.tar.gz -C /tmp/redis --strip-components=1

  echo "make"
  make -C /tmp/redis

  echo "make install"
  make -C /tmp/redis install

  echo "running install_server"
  echo -n | /tmp/redis/utils/install_server.sh

  rm -rf /tmp/redis*

  sysctl vm.overcommit_memory=1

  # Bind Redis to localhost. Comment out to make available externally.
  sed -ie 's/# bind 127.0.0.1/bind 127.0.0.1/g' /etc/redis/6379.conf

  service redis_6379 restart

fi
