rhce-lab
========

This repo contains a lab, which can be used for practice the rhce exam.

Prerequisites
-------------

The following software need to be installed on your machine:

##### 1. Install Packer to build the base box

[Download for Packer for your OS](https://www.packer.io/downloads.html)

##### 2. Install Vagrant to launch your lab

[Download Vagrant for your OS](https://www.vagrantup.com/downloads.html)

##### 3. Download VirtualBox to launch your machines

[Download VirtualBox for your OS](https://www.virtualbox.org/wiki/Downloads)

Directory structure
-------------------

The repo has the following structure:

```
rhce-lab/
├── scripts/
│   ├── base.sh
│   ├── dns.sh
│   ├── route_0.sh
│   ├── route_1.sh
│   └── router.sh
├── packer/
│   ├── build/
│   ├── http/
│   |   └── ks.cfg
│   └── scripts/
|   │   ├── base.sh
│   │   ├── cleanup.sh
│   │   ├── laravel.sh
│   │   ├── vagrant.sh
│   │   └── virtualbox.sh
│   ├── packer.json
├── Vagrantfile
└── README

```

Installation
------------

First clone the repository:

      git clone https://github.com/supercoast/rhce-lab
      cd rhce-lab

To setup the lab, there are two steps required:

##### 1. Build a base box using Packer

      packer build packer/centos7.json

##### 2. Import the Vagrant box

      vagrant box add unibe/centos7 build/centos7.box

Finally you can optionally make adjustments in the Vagrant file or just launch the lab with preconfigured options:

      vagrant up
