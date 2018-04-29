#!/bin/bash

yum -y update

timedatectl set-timezone Europe/Zurich
systemctl restart chronyd

echo "192.168.0.0/24 via 192.168.2.2" > /etc/sysconfig/network-scripts/route-enp0s8
nmcli con reload
systemctl restart network

sed -i '2 a search example.com' /etc/resolv.conf
sed -i '3 a nameserver 192.168.0.3' /etc/resolv.conf
