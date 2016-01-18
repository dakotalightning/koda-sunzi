# Server provisioning recipes

These recipes will provision a server for a Rails 4.2.4 app, using [Capistrano 3.1](http://capistranorb.com/), for deployment. It will install nginx, rbenv (and Ruby), node.js, redis, and mysql. It also creates a deploy user, and sets up the environment for deployment.

This recipe installs ppa's to make sure apt installs the latest software.

## Installation

You need [sunzi](https://github.com/kenn/sunzi).

    gem install sunzi

## Steps

1. The best way to get started is to add as a git module into `/sunzi` before `sunzi create`
  - Alt: Clone it into a directory and copy the files you want over into your project.
2. Edit `sunzi.yml` with your app name and mysql information.
3. Make sure it will setup things the way you want.
4. This script will setup mysql for password authentication, instead of authentication based on the machine's user.
5. Make sure you can ssh to your server with the root account. You might want to copy your ssh public key into /root/.ssh/authorized_keys, so you don't have to type the password.
6. `sunzi deploy [HOST/IP]`.

## Customization

The main script is `install.sh`. Here you can change which recipes will be run, do special stuff, etc.
The recipes reside in (surprise!) `recipes/`. You can add new ones if you like.
If you want to know more (attribute variable usage, etc.) consult the [sunzi documentation](https://github.com/kenn/sunzi#readme).
