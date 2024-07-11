#!/bin/bash -e

rm /etc/docker/daemon.json

if [ -e /etc/docker/daemon.json.old ]
then
    mv /etc/docker/daemon.json.old /etc/docker/daemon.json
fi

echo "Se ha dejado la configuración de Docker tal y como estaba antes"

systemctl restart docker

echo "Se ha reiniciado el demonio de Docker"