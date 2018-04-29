#!/bin/bash

yum -y update

timedatectl set-timezone Europe/Zurich
systemctl restart chronyd

echo "net.ipv4.ip_forward=1" > /etc/sysctl.d/ip_forwarding.conf
sysctl -p /etc/sysctl.d/ip_forwarding.conf

#firewall-cmd --remove-interface=enp0s8 --zone=public --permanent
#firewall-cmd --add-interface=enp0s8 --zone=internal --permanent
#firewall-cmd --add-masquerade --zone=internal --permanent
#firewall-cmd --reload

firewall-cmd --set-default-zone=trusted

sed -i '2 a search example.com' /etc/resolv.conf
sed -i '3 a nameserver 192.168.0.3' /etc/resolv.conf
