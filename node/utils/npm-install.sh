#!/bin/bash

NODE_VERSION=node
NPM_VERSION=
PACKAGES=()
while [[ $# -gt 0 ]]; do
  key="$1"
  case $key in
    --node-version)
        NODE_VERSION=$2
        shift # past argument
        shift # past value
        ;;
    --npm-version)
        NPM_VERSION=$2
        shift # past argument
        shift # past value
        ;;
      *)    # unknown option
        PACKAGES+=("$1") # save it in an array for later
        shift # past argument
        ;;
  esac
done

. nvm-install.sh

. nvm-activate.sh

nvm install ${NODE_VERSION}

if [[ ! -z ${NPM_VERSION} ]]; then
  npm install -g npm@${NPM_VERSION}
fi

if [[ ${#PACKAGES[@]} -gt 0 ]]; then
  npm install "${PACKAGES[@]}"
fi