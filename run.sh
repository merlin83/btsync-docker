#!/bin/sh

if [ ! -d /opt/btsync ]; then
    mkdir -p /opt/btsync
fi;

docker run  -P \
            -v "/opt/btsync/:/btsync/" \
            -v "$PWD/conf/:/tmp/conf/" \
            --name btsync \
            merlin83/btsync
