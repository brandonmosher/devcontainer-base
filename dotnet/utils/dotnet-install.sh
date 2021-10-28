#!/bin/sh

apt-helper --no-upgrade --no-clean wget
wget https://packages.microsoft.com/config/ubuntu/21.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
apt-helper --no-upgrade apt-transport-https dotnet-sdk-5.0
