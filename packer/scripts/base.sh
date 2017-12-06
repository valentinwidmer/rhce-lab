#!/usr/bin/env bash

set -e

# Determine out the OS major version and EPEL release package name
PLATFORM=$(uname -i)

REPO_URL="http://mirror.switch.ch/ftp/mirror/epel/7/x86_64/Packages/e/epel-release-7-11.noarch.rpm"

# Install the EPEL repository
echo "Configuring EPEL repository on $PLATFORM."
REPO_PATH=$(mktemp)
curl -k -L $REPO_URL -o $REPO_PATH
rpm -i "$REPO_PATH" >/dev/null
rm -f $REPO_PATH >/dev/null

# Install packages that are dependencies later in the process
echo 'Installing packages for dependency.'
yum -y install gcc make kernel-devel-"$(uname -r)" kernel-headers-"$(uname -r)" zlib-devel openssl-devel readline-devel sqlite-devel perl wget dkms nfs-utils ntpdate >/dev/null
echo "Dependencies installed"

exit 0
