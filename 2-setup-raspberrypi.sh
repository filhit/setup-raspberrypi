#!/bin/bash
sudo raspi-config nonint do_ssh 0
sudo raspi-config nonint do_memory_split 512
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install vim tmux kodi git mc python3 python3-venv python3-pip libffi-dev
sudo pip install python-dateutil # required for Subsonic Kodi add-in

# homeassistant installation

cd ~
git clone git@github.com:filhit/sensors.git
git clone git@github.com:adafruit/Adafruit_Python_BMP.git
sudo python Adafruit_Python_BMP/setup.py install
cd -

#sudo pip3 install Adafruit_DHT

sudo useradd -rm homeassistant -G dialout,gpio
cd /srv
sudo mkdir homeassistant
sudo chown homeassistant:homeassistant homeassistant
cd -

sudo -u homeassistant -H ./setup-as-homeassistant-user.sh
sudo cp home-assistant@homeassistant.service /etc/systemd/system/home-assistant@homeassistant.service 
sudo systemctl --system daemon-reload
sudo systemctl enable home-assistant@homeassistant
sudo systemctl start home-assistant@homeassistant
