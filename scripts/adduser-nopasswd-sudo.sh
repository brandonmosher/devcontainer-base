#!/bin/sh

# Adds a sudo user that does not require a password.

# Requires sudo

if [ "$#" -ne 1 ]; then
    echo "usage: ${0} [username]"
    exit 1
fi

USERNAME="$1"
adduser --disabled-password --gecos '' ${USERNAME}
adduser ${USERNAME} sudo
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
echo 'USER="'${USERNAME}'"; export USER' >> /home/${USERNAME}/.bashrc
echo 'USER="'${USERNAME}'"; export USER' >> /home/${USERNAME}/.profile