#!/bin/bash

# Wrapper for sdkman to install multiple sdks in a single command 
# and clean up junk files to reduce container size.

# Requires packages zip, unzip, curl

# Args are double-quoted strings containing sdkman candidates
if [ "$#" -eq 0 ]; then
    echo "usage: ${0} ["[sdk [version]]", ...]"
    echo 'example: '${0}' "java 11.0.9.hs-adpt" "gradle 6.8" "maven" "ivy"'
    exit 1
fi

cd ~

CONFIG="sdkman_auto_answer=false
sdkman_auto_selfupdate=false
sdkman_insecure_ssl=false
sdkman_curl_connect_timeout=14
sdkman_curl_max_time=20
sdkman_beta_channel=false
sdkman_debug_mode=false
sdkman_colour_enable=true
sdkman_auto_env=false"

curl -s "https://get.sdkman.io" | bash
source .sdkman/bin/sdkman-init.sh
echo "${CONFIG}" > ~/.sdkman/etc/config

for arg in "$@"
do
    sdk install ${arg}
done

rm -rf .sdkman/archives/*
rm -rf .sdkman/tmp/*
