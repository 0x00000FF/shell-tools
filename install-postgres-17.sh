#!/bin/sh

if [ ! $UID -eq 0 ]; then
    echo 'superuser required'
    exit;
fi

dnf -y update

# FROM https://www.postgresql.org/download/linux/redhat/
# Install the repository RPM:
sudo dnf install -y https://download.postgresql.org/pub/repos/yum/reporpms/EL-9-x86_64/pgdg-redhat-repo-latest.noarch.rpm

# Disable the built-in PostgreSQL module:
sudo dnf -qy module disable postgresql

# Install PostgreSQL:
sudo dnf install -y postgresql17-server
