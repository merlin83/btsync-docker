#!/bin/sh

if [ ! -d /opt/btsync ]; then
    mkdir -p /opt/btsync
fi;

if [ ! -e conf/btsync.conf ]; then
    if [ -n $1 ]; then
        echo "Using Secret: " $1;
        sed 's/"secret" : ""/"secret" : "'$1'"/g' conf/btsync.conf.template > conf/btsync.conf
    else
        echo "No secret specified!";
        cp conf/btsync.conf.template conf/btsync.conf
    fi;
else
    echo "Using conf/btsync.conf";
fi;

docker run  -d -P \
            -v "/opt/btsync/:/btsync/" \
            -v "$PWD/conf/:/tmp/conf/" \
            --name btsync \
            merlin83/btsync
