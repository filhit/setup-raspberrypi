#!/bin/bash
set -e

sudo apt install tor
sudo systemctl enable tor

# Prepare sshd_config following https://stribika.github.io/2015/01/04/secure-secure-shell.html

# Put the following lines to /etc/tor/torrc"
# HiddenServiceDir /var/lib/tor/ssh_hidden_service/
# HiddenServicePort 22 127.0.0.1:22

sudo systemctl restart tor

sudo cat /var/lib/tor/ssh_hidden_service/hostname
