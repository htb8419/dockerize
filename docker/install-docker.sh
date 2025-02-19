#!/usr/bin/env bash

#wget https://download.docker.com/linux/static/stable/x86_64/docker-27.3.1.tgz -qO- | tar xvfz - docker/docker --strip-components=1
chmod -R +x ./bin/
cp -drp ./bin/* /usr/local/bin
if [ ! -d /etc/docker ]; then
    mkdir /etc/docker;
fi;
cp -d ./deamon.json /etc/docker/
cp -d ./dockerd.service /etc/systemd/system/
systemctl start dockerd.service
docker login
#journalctl -xeu dockerd.service