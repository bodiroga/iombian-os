#!/bin/bash -e

echo "Vamos a hacer un backup del fichero de configuración de Docker"

if [ -e /etc/docker/daemon.json ]
then
    mv /etc/docker/daemon.json /etc/docker/daemon.json.old
fi

echo "Se ha hecho el backup del fichero de configuración de Docker"

echo "Vamos a editar el fichero de configuración de Docker"

mkdir -p /etc/docker

cat > /etc/docker/daemon.json << EOF
{
    "data-root": "${ROOTFS_DIR}/var/lib/docker"
}
EOF

echo "Se ha editado el fichero de configuración de Docker"

echo "Reiniciamos el demonio de docker"

systemctl restart docker

echo "Se ha reiniciado el demonio de docker"

echo "Vamos a hacer un pull de prueba de la imagen hello-world"

echo "Se ha hecho el pull de prueba de la imagen hello-world"