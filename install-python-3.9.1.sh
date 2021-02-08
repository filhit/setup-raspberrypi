#!/bin/bash
set -e

#Install the packages
sudo apt-get --assume-yes install build-essential python-dev python-setuptools python-pip python-smbus libncursesw5-dev libgdbm-dev libc6-dev zlib1g-dev libsqlite3-dev tk-dev libssl-dev openssl libffi-dev

#Install python
cd ~
wget https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tgz
tar xzvf Python-3.9.1.tgz
cd Python-3.9.1/
./configure
make
sudo make install
