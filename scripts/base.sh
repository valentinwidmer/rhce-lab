#!/bin/bash

# Ignore default nameserver for internal lookup
sed -i '2 a nameserver 192.168.0.2' /etc/resolv.conf

# Set timezone and synchronize with default timeserver
timedatectl set-timezone Europe/Zurich
systemctl restart chronyd
