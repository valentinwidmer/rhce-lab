# rhce-lab

This repo contains a lab, which can be used for practice the rhce exam.

## Getting started

### Prerequisites

1. Packer need to be installed for building the Vagrant box [Download Packer from offical website](https://www.packer.io/downloads.html)
2. Vagrant need to be installed for building the lab [Download Vagrant from offical website](https://www.vagrantup.com/downloads.html)
3. For launching the machines you need also VirtualBox [Download VirtualBox from offical website](https://www.virtualbox.org/wiki/Downloads)

### Directory structure

The followng desribes the folder and document structure.

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

### Setup lab

First you have to build a Vagrant box. Open a terminal and navigate into the folder packer. There you execute the following command.

`packer build centos7.json`

After completion you should find a file called 'centos7.box' inside the 'build directory'.

Then you have to import the Vagrant box with the following command.

`vagrant box add unibe/centos7 build/centos7.box`

Finally you can get out of the packer directory and run the lab with the following command.

`vagrant up`
