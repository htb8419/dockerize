#!/usr/bin/env bash

wget https://download.docker.com/linux/static/stable/x86_64/docker-27.3.1.tgz -qO- | tar xvfz - docker/docker --strip-components=1
mv ./docker /usr/local/bin
mkdir /etc/docker
cp ./deamon.json /etc/docker/
cp ./dockerd.service /etc/systemd/system/
systemctl start dockerd.service
docker login
#journalctl -xeu dockerd.service