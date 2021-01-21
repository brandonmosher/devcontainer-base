# devcontainer-base

## Overview
This Dockerfile builds a ubuntu image intended as a common base for language-specific or project-specific development images. The goal is to eliminate duplication of boilerplate configuration needed to make the container more suitable for interactive use. This includes setting the timezone and locale, and creating a non-root sudo user. No assumptions are made about derived containers i.e. no compilers, version control, build system, libraries, etc... are included.

## Automatic Builds
Changes to this Dockerfile trigger automatic builds for mosherbd/devcontainer-base on Docker Hub.

## Utils
Utils are copied to DEVCONTAINER_UTILS_PATH so that they can be used in derived images. DEVCONTAINER_UTILS_PATH is set as an environment variable so that serived images may add additional scripts to this path.
- adduser-nopassword-sudo.sh
Adds a sudo user that requires no password for quick and easy ad-hoc container changes
- apt-install.sh
Runs standard updates/install/upgrade/cleanup sequence for docker
