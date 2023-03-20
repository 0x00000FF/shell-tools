#!/bin/sh

if [ ! $UID -eq 0 ]; then
    echo 'superuser required'
    exit;
fi

dnf -y update
dnf -y install yum-utils

yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

dnf -y update
dnf -y install docker-ce docker-ce-cli containerd.io

systemctl enable --now docker
