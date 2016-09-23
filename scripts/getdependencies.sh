#!/bin/bash

set -e

CENTOSIMG="centos-7-docker.tar.xz"
if [ ! -f ./base/$CENTOSIMG ]; then
     curl -L -o base/$CENTOSIMG https://github.com/CentOS/sig-cloud-instance-images/raw/CentOS-7/docker/$CENTOSIMG
fi

exit 0
