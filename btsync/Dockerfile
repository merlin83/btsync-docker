FROM debian:sid

MAINTAINER merlin83

RUN apt-get update; apt-get install -qy wget; apt-get clean

RUN cd /tmp/ && \
    wget http://download-new.utorrent.com/endpoint/btsync/os/linux-x64/track/stable && \
    tar -zxf stable && \
    rm stable

EXPOSE 27015

RUN mkdir -p /btsync/ && mkdir -p /tmp/conf/

VOLUME ["/btsync", "/tmp/conf"]

CMD cp /tmp/conf/btsync.conf /tmp/btsync.conf && \
    sed -i "s/My Sync Device/docker \(merlin83\) \- $HOSTNAME/g" /tmp/btsync.conf && \
    /tmp/btsync --log /tmp/btsync.log --config /tmp/btsync.conf && \
    tail -fF /tmp/btsync.log
