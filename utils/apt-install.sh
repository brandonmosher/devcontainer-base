#!/bin/sh

# Runs standard updates/install/upgrade/cleanup sequence for docker

if [ "$#" -eq 0 ]; then
    echo "usage: ${0} [options] [package names]"
    exit 1
fi
ln -fs /usr/share/zoneinfo/${TZ} /etc/localtime
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y "$@"
DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y
apt-get clean autoclean
apt-get autoremove -y
rm -rf /var/lib/apt/lists/*
rm -rf /tmp/*