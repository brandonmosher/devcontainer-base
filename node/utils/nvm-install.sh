#!/bin/sh

NVM_VERSION=$(curl -s https://api.github.com/repos/nvm-sh/nvm/tags | grep name -m 1 | xargs | cut -c7- | sed 's/,$//')

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${NVM_VERSION}/install.sh | bash
