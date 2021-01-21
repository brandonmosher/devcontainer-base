#!/bin/sh

# Runs standard updates/install/upgrade/cleanup sequence for docker

# Requires root priveledges

# All args are passed unmodified to apt-get install

apt-get update
apt-get install -y "$@"
apt-get dist-upgrade -y
apt-get clean autoclean
apt-get autoremove -y
rm -rf /var/lib/apt/lists/*
rm -rf /tmp/*