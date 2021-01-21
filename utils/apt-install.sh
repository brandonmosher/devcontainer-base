#!/bin/sh

# Runs standard updates/install/upgrade/cleanup sequence for docker

if [ "$#" -eq 0 ]; then
    echo "usage: ${0} [options] [package names]"
    exit 1
fi

apt-get update
apt-get install -y "$@"
apt-get dist-upgrade -y
apt-get clean autoclean
apt-get autoremove -y
rm -rf /var/lib/apt/lists/*
rm -rf /tmp/*