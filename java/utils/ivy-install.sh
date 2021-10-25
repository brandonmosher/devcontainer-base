#!/bin/bash

# Automates installation of the specified version of ivy

# Requires curl, gpg, tar packages

if [ "$#" -ne 2 ]; then
    echo "usage: ${0} [ivy version] [ivy jar dest filepath]"
    exit 1
fi

cd ~

ANT_HOST=https://downloads.apache.org/ant
ANT_KEYS_FILENAME=KEYS

IVY_VERSION="${1}"
IVY_JAR_DEST_FILEPATH="${2}"

IVY_HOST=${ANT_HOST}/ivy/${IVY_VERSION}
IVY_TAR_FILENAME=apache-ivy-${IVY_VERSION}-bin.tar.gz
IVY_JAR_SRC_FILEPATH=${IVY_TAR_FILENAME/-bin.tar.gz/}/ivy-${IVY_VERSION}.jar
IVY_ASC_FILENAME=${IVY_TAR_FILENAME}.asc

curl -O -J -L ${IVY_HOST}/${IVY_TAR_FILENAME}
curl -O -J -L ${IVY_HOST}/${IVY_ASC_FILENAME}
curl -O -J -L ${ANT_HOST}/${ANT_KEYS_FILENAME}

gpg --import ${ANT_KEYS_FILENAME}
if ! gpg --verify ${IVY_ASC_FILENAME} ${IVY_TAR_FILENAME}; then
    echo "error: gpg could not be verified"
    exit 1
fi

mkdir -p ${IVY_JAR_DEST_FILEPATH}
tar -xvf ${IVY_TAR_FILENAME} -C ${IVY_JAR_DEST_FILEPATH} --strip-components=1 ${IVY_JAR_SRC_FILEPATH}
rm -rf ${IVY_TAR_FILENAME} ${IVY_ASC_FILENAME} ${ANT_KEYS_FILENAME}
