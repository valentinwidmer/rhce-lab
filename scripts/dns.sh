#!/bin/bash

# This script provides an internal DNS environment

yum -y update

yum -y install dnsmasq

sed -i 's/#listen-address=/listen-address=127.0.0.1,192.168.0.3/g' /etc/dnsmasq.conf

# Setup /etc/hosts
echo "192.168.0.3 server.example.com" >> /etc/hosts
echo "192.168.0.2 router.example.com" >> /etc/hosts
echo "192.168.2.2 router.example.com" >> /etc/hosts
echo "192.168.0.10 client01.example.com" >> /etc/hosts
echo "192.168.2.10 client02.example.com" >> /etc/hosts
echo "192.168.2.13 client03.example.com" >> /etc/hosts
echo "192.168.2.14 client04.example.com" >> /etc/hosts

echo "192.168.0.3 website01.example.com" >> /etc/hosts
echo "192.168.0.3 website02.example.com" >> /etc/hosts

systemctl start dnsmasq
systemctl enable dnsmasq

# Configure routing
echo "192.168.2.0/24 via 192.168.0.2" > /etc/sysconfig/network-scripts/route-enp0s8
nmcli con reload
systemctl restart network

# Allow all traffic
firewall-cmd --permanent --add-service=dns
firewall-cmd --reload

# Set timezone and sychronize with timeserver
timedatectl set-timezone Europe/Zurich
systemctl restart chronyd

# Use local DNS for lookup
sed -i '2 a search example.com' /etc/resolv.conf
sed -i '3 a nameserver 127.0.0.1' /etc/resolv.conf
