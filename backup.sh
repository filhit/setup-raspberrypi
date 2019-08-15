mkdir ~/backup
cp -r ~/.kodi/ ~/backup/
sudo rsync -r --exclude "deps" --exclude "components" --exclude "home-assistant.db" --exclude "home-assistant_v2.db*" --exclude "home-assistant.log" /home/homeassistant/.homeassistant/ ~/backup/.homeassistant/
cp -r /var/lib/co2monitor/data/ ~/backup/
sudo tar -cvzf backup.tar.gz -C ~/backup/ .
