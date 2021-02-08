#!/bin/bash
set -e

#Install the packages
sudo apt-get --assume-yes install build-essential tk-dev libncurses5-dev libncursesw5-dev libreadline6-dev libdb5.3-dev libgdbm-dev libsqlite3-dev libssl-dev libbz2-dev libexpat1-dev liblzma-dev zlib1g-dev

#Install python
cd ~
wget https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tgz
tar xzvf Python-3.9.1.tgz
cd Python-3.9.1/
./configure
make
sudo make install
