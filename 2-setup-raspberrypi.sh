#!/bin/bash
sudo raspi-config nonint do_ssh 0
sudo raspi-config nonint do_memory_split 512
sudo raspi-config nonint do_i2c 0
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install vim tmux kodi git mc python3 python3-venv python3-pip libffi-dev libssl-dev nmap
sudo apt-get install python-dateutil # required for Subsonic Kodi add-in

# homeassistant installation

cd ~
git clone git@github.com:filhit/sensors.git
chmod -R a+rx sensors/
sudo pip install adafruit-bmp

sudo useradd -rm homeassistant -G dialout,gpio,i2c
cd /srv
sudo mkdir homeassistant
sudo chown homeassistant:homeassistant homeassistant
cd -

sudo -u homeassistant -H ./setup-as-homeassistant-user.sh
sudo cp home-assistant@homeassistant.service /etc/systemd/system/home-assistant@homeassistant.service 
sudo systemctl --system daemon-reload
sudo systemctl enable home-assistant@homeassistant
sudo systemctl start home-assistant@homeassistant

wget https://gitlab.com/nobodyinperson/co2monitor/-/jobs/artifacts/v0.0.14/download?job=debian-package-build -O build_v0.0.14.zip
unzip build_v0.0.14.zip
rm build_v0.0.14.zip
sudo apt-get install r-base-core at
sudo dpkg -i debian-package/co2monitor_*.deb
rm -rf debian-package
sudo systemctl start co2monitor
echo "Start co2monitor (try all hidraw*):"
echo "export DEVNAME=/dev/hidraw0"
echo "co2monitor-invoker"
