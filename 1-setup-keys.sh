#!/bin/bash
PUB_KEY='ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILYmp1MFc552TYMnxX3eewRx4n8Rb3G/p09pl6Hq2Tkq filhit@FILHIT-VAIO'

if [ ! -f "/home/pi/.ssh/id_ed25519" ]; then
  ssh-keygen -t ed25519 -o -a 100
fi

umask 0077
mkdir -p ~/.ssh
grep -q -F "$PUB_KEY" ~/.ssh/authorized_keys 2>/dev/null || echo "$PUB_KEY" >> ~/.ssh/authorized_keys

echo "Add this to VAIO, github, nokia"
printf '%b\n' "$(cat ~/.ssh/id_ed25519.pub)"
