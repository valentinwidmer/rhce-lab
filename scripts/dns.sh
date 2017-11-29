#!/bin/bash

# This script provide an internal DNS environment

yum -y update

sed -i 's/#listen-address=/listen-address=127.0.0.1,192.168.0.3/g' /etc/dnsmasq.conf

# Setup /etc/hosts
echo "192.168.0.3 server.example.com" >> /etc/hosts
echo "192.168.0.10 client01.example.com" >> /etc/hosts
echo "192.168.1.10 client02.example.com" >> /etc/hosts
echo "192.168.0.2 router.example.com" >> /etc/hosts
echo "192.168.1.2 router.example.com" >> /etc/hosts
echo "192.168.0.3 example.com" >> /etc/hosts
echo "192.168.0.3 example02.com" >> /etc/hosts

systemctl start dnsmasq
systemctl enable dnsmasq

# Configure Routing
echo "192.168.1.0/24 via 192.168.0.2" > /etc/sysconfig/network-scripts/route-enp0s8

# Allow DNS Traffic
firewall-cmd --permanent --add-service=dns
firewall-cmd --reload

# Set timezone and sychronize with timeserver
timedatectl set-timezone Europe/Zurich
systemctl restart chronyd

# Use local DNS for lookup
sed -i '2 a nameserver 127.0.0.1' /etc/resolv.conf
