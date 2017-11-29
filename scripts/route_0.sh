#!/bin/bash

yum -y update

timedatectl set-timezone Europe/Zurich
systemctl restart chronyd

echo "192.168.1.0/24 via 192.168.0.2" > /etc/sysconfig/network-scripts/route-enp0s8

sed -i '2 a nameserver 192.168.0.3' /etc/resolv.conf
