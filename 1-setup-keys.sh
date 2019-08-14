#!/bin/bash
PUB_KEYS=(
  'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILYmp1MFc552TYMnxX3eewRx4n8Rb3G/p09pl6Hq2Tkq filhit@FILHIT-VAIO'
  'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO31NJ9yUb5eRTttFzKZzwavdkTSmoSu9fBZaMFRDUop nokia'
)


if [ ! -f "/home/pi/.ssh/id_ed25519" ]; then
  ssh-keygen -t ed25519 -o -a 100
fi

umask 0077
mkdir -p ~/.ssh
for i in ${!PUB_KEYS[*]}
do
  PUB_KEY=${PUB_KEYS[$i]}
  grep -q -F "$PUB_KEY" ~/.ssh/authorized_keys 2>/dev/null || echo "$PUB_KEY" >> ~/.ssh/authorized_keys
done

echo "Add this to VAIO, github, nokia"
printf '%b\n' "$(cat ~/.ssh/id_ed25519.pub)"
