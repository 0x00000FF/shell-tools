#!/bin/sh

if [ ! $UID -eq 0 ]; then
    echo 'superuser required'
    exit;
fi

wget https://raw.githubusercontent.com/0x00000FF/shell-tools/refs/heads/master/yum.repos.d/mariadb-11.4.repo -O /etc/yum.repos.d/MariaDB.repo
dnf -y update

sudo dnf install -y MariaDB-server MariaDB-client
