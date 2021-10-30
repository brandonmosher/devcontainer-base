#!/bin/sh

curl https://packages.microsoft.com/config/ubuntu/21.04/packages-microsoft-prod.deb -o packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
apt-helper --no-upgrade apt-transport-https dotnet-sdk-5.0
