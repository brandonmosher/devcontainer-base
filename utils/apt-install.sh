#!/bin/sh

# Runs standard updates/install/upgrade/cleanup sequence for docker

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y "$@"
DEBIAN_FRONTEND=noninteractive apt-get dist-upgrade -y
apt-get clean autoclean
apt-get autoremove -y
rm -rf /var/lib/apt/lists/*
rm -rf /tmp/*