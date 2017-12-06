#!/usr/bin/env bash

# Clean up rhel specific stuff
echo "Removing repo definition."
yum -y erase epel-release*

# Remove MAC from network interface config
echo "Cleaning network interface configuration."
sed -i "s/HWADDR=.*//" /etc/sysconfig/network-scripts/ifcfg-eth0

exit 0
