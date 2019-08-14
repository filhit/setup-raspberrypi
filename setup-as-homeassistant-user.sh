#!/bin/bash
set -e

cd /srv/homeassistant
python3 -m venv .
source bin/activate
python3 -m pip install wheel
pip3 install homeassistant
deactivate
