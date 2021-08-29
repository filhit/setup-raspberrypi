#!/bin/bash
set -e

PUB_KEYS=(
  'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILYmp1MFc552TYMnxX3eewRx4n8Rb3G/p09pl6Hq2Tkq filhit@FILHIT-VAIO'
  'ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIO31NJ9yUb5eRTttFzKZzwavdkTSmoSu9fBZaMFRDUop nokia'
  'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAgEAjFlM3q0XBd9G1ZJD/mO4JKcd6LaZTKyvGHojBJvOKo2yhIM2WVfbVUBLSSvGb9FbkPVNXK+7s+kjBOI+xZyn8APJ5wHHdenHR49aOGye5siKJF3N91DEVXZMgXBDhHwkoksoBRGQeqc+ULSAdHm1lkPYMOvpT4kGBV0JZKF3M+rMFvDD0L+b4gNIq4UCfIQaSnOAaxO9bbka0lvYJ2zak89+sB8kvi6VrvnRBYSjymLcoO2PNqqC3vhJXVuZGE7np7VcqsGJdJvHrmD1tSc433y4PwzHZsddvvGwRzcBjT1F/IsPWiQ/RgR4IaP3mtZ0JLX7zQpgO6s8HhRFvAYmzLnjugRy5TRt7JAa+oMtf3c/Be6bJ8U2FfMEUZjx8l11xca9StyNnDePVK0RfLQ+vlUmNqVtaz1dOFmwJ/aLJhbSD5Gp96+ikcFb1crypgw5XS3fbi7HQMfeas2GjBIzYH2WXJZBkXZ9c8ZiGzTZ4UBHX0PXBtcB4KxkYA0YS/AzqVhbgQJOQLUFPK+kpzJo1m4/EzOxomZaachFHrcrOh3dDdq7IgQOC+RxF+S9J4H5Ec/cctNj90oRzxmE2/FlINgTMz0vvEAYMEJdGwarlwERySRPXaqstxQbSq+ee01qNRGo/CzbIL8mmJcGLydvupxsjXFTgufd+BSGrZCfzyE= rsa-key-20151209'
)

if [ ! -f "/home/pi/.ssh/id_ed25519" ]; then
  ssh-keygen -t ed25519 -o -a 100 -N '' -f "/home/pi/.ssh/id_ed25519"
fi

umask 0077
mkdir -p ~/.ssh
for i in ${!PUB_KEYS[*]}
do
  PUB_KEY=${PUB_KEYS[$i]}
  grep -q -F "$PUB_KEY" ~/.ssh/authorized_keys 2>/dev/null || echo "$PUB_KEY" >> ~/.ssh/authorized_keys
done

echo "Public key:"
printf '%b\n' "$(cat ~/.ssh/id_ed25519.pub)"
