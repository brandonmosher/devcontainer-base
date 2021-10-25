# devcontainer-java

## Overview

This Dockerfile extends the brandonmosher/devcontainer-base container image with sdkman, java sdk, ant, ivy, maven, and gradle. Specific versions for each can easily be specified in the Dockerfile.

## Utils

The following utils are copied to DEVCONTAINER_UTILS_PATH.

### ivy_install.sh 

Automates installation of the specified version of ivy

    ivy_install.sh [ivy version] [ivy jar dest filepath]

### sdk_install.sh

Wrapper for sdkman to install multiple sdks in a single command and clean up junk files to reduce container size.

    sdk_install.sh ["[sdk [version]]", ...]
