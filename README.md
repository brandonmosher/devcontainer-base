# devcontainer-base

## Overview

This Dockerfile builds a ubuntu container image intended as a common base for language-specific or project-specific development images. The goal is to eliminate duplication of boilerplate configuration needed to make the container more suitable for interactive use. This includes setting the timezone and locale, and creating a non-root sudo user. No assumptions are made about derived containers i.e. no compilers, version control, build system, libraries, etc... are included.

## Automatic Builds

Changes to this Dockerfile trigger automatic builds for mosherbd/devcontainer-base on Docker Hub.

## Utils

The following utils are copied to DEVCONTAINER_UTILS_PATH. DEVCONTAINER_UTILS_PATH defaults to /usr/local/bin making the utils available from $PATH. Furhtermore, DEVCONTAINER_UTILS_PATH is set as a persistent environment variable so that derived images may use these utils and add additional utils as needed.

### adduser-nopassword-sudo.sh

Adds a sudo user that requires no password for quick and easy ad-hoc container changes

    adduser-nopassword-sudo.sh [username]

### apt-install.sh

Combines apt update/install/dist-upgrade/cleanup tasks

    apt-install.sh [options] [package names]
