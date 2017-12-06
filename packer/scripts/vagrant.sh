#!/usr/bin/env bash

# Add build date and time
date > /etc/vagrant_box_build_time

# Setup vagrant user
echo 'Setting up home directory of user vagrant.'
mkdir -pm 700 /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

# Setup sudo to allow no-password sudo for "sudo"
# Groups/sudo stuff already done in ks.cfg
sed -i "s/^.*requiretty/#Defaults requiretty/" /etc/sudoers

exit 0
